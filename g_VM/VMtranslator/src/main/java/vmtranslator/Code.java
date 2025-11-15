package vmtranslator;

import java.util.*;
import java.io.*;
import java.nio.file.*;
 
public class Code {
    private int labelCounter = 0;
 
    PrintWriter outputFile = null;
    String filename = null;
    int lineCode = 0;
    int cont = 0;

    public Code(String filename) throws FileNotFoundException,IOException {
        File file = new File(filename);
        this.outputFile = new PrintWriter(new FileWriter(file));
    }

    public void writeArithmetic(String command) {

        if ( command.equals("")) {
            Error.error("Instrução invalida");
        }

        List<String> commands = new ArrayList<String>();

        if(command.equals("add")) {
            commands.add(String.format("; %d - ADD", lineCode++));
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("decw %A");
            commands.add("addw (%A), %D, %D");
            commands.add("movw %D, (%A)");
            commands.add("leaw $0, %A"); 
            commands.add("movw (%A), %D"); 
            commands.add("decw %D"); 
            commands.add("movw %D, (%A)");

        } else if (command.equals("sub")) {
            commands.add(String.format("; %d - SUB", lineCode++));
            
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("movw %D, %A");
            
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            
            commands.add("subw %A, %D, %D");
            
            commands.add("movw %D, (%A)");
            
            commands.add("leaw $0, %A"); 
            commands.add("movw (%A), %D"); 
            commands.add("decw %D"); 
            commands.add("movw %D, (%A)");

        } else if (command.equals("neg")) {
            commands.add(String.format("; %d - NEG", lineCode++));
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("negw %D");
            commands.add("movw %D, (%A)");

        } else if (command.equals("eq")) {
            String trueLabel = "EQ_TRUE_" + labelCounter;
            String endLabel = "EQ_END_" + labelCounter;
            labelCounter++;
            
            commands.add(String.format("; %d - EQ", lineCode++));
            
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");    
            commands.add("decw %A");          
            commands.add("decw %A");          
            commands.add("movw (%A), %D");    
            commands.add("incw %A");           
            
            commands.add("subw (%A), %D, %D");
            
            commands.add("leaw $" + trueLabel + ", %A");
            commands.add("je %D");
            commands.add("nop");
            
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("decw %A");
            commands.add("movw $0, %D");
            commands.add("movw %D, (%A)");
            commands.add("leaw $" + endLabel + ", %A");
            commands.add("jmp");
            commands.add("nop");
            
            commands.add(trueLabel + ":");
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("decw %A");
            commands.add("movw $-1, %D");
            commands.add("movw %D, (%A)");
            
            commands.add(endLabel + ":");
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %D");
            commands.add("decw %D");
            commands.add("movw %D, (%A)");

        } else if (command.equals("gt")) {
            String trueLabel = "GT_TRUE_" + labelCounter;
            String endLabel = "GT_END_" + labelCounter;
            labelCounter++;
            
            commands.add(String.format("; %d - GT", lineCode++));
            
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("incw %A");
            commands.add("subw (%A), %D, %D");
            
            commands.add("leaw $" + trueLabel + ", %A");
            commands.add("jg %D");
            commands.add("nop");
            
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("decw %A");
            commands.add("movw $0, %D");
            commands.add("movw %D, (%A)");
            commands.add("leaw $" + endLabel + ", %A");
            commands.add("jmp");
            commands.add("nop");
            
            commands.add(trueLabel + ":");
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("decw %A");
            commands.add("movw $-1, %D");
            commands.add("movw %D, (%A)");
            
            commands.add(endLabel + ":");
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %D");
            commands.add("decw %D");
            commands.add("movw %D, (%A)");

        } else if (command.equals("lt")) {
            String trueLabel = "LT_TRUE_" + labelCounter;
            String endLabel = "LT_END_" + labelCounter;
            labelCounter++;
            
            commands.add(String.format("; %d - LT", lineCode++));
            
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("incw %A");
            commands.add("subw (%A), %D, %D");
            
            commands.add("leaw $" + trueLabel + ", %A");
            commands.add("jl %D");
            commands.add("nop");
            
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("decw %A");
            commands.add("movw $0, %D");
            commands.add("movw %D, (%A)");
            commands.add("leaw $" + endLabel + ", %A");
            commands.add("jmp");
            commands.add("nop");
            
            commands.add(trueLabel + ":");
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("decw %A");
            commands.add("movw $-1, %D");
            commands.add("movw %D, (%A)");
            
            commands.add(endLabel + ":");
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %D");
            commands.add("decw %D");
            commands.add("movw %D, (%A)");
        } else if (command.equals("and")) {
            commands.add(String.format("; %d - AND", lineCode++));
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("decw %A");
            commands.add("andw (%A), %D, %D");
            commands.add("movw %D, (%A)");
            commands.add("leaw $0, %A"); 
            commands.add("movw (%A), %D"); 
            commands.add("decw %D"); 
            commands.add("movw %D, (%A)");

        } else if (command.equals("or")) {
            commands.add(String.format("; %d - OR", lineCode++));
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("decw %A");
            commands.add("orw (%A), %D, %D");
            commands.add("movw %D, (%A)");
            commands.add("leaw $0, %A"); 
            commands.add("movw (%A), %D"); 
            commands.add("decw %D"); 
            commands.add("movw %D, (%A)");
        } else if (command.equals("not")) {
            commands.add(String.format("; %d - NOT", lineCode++));
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("notw %D");
            commands.add("movw %D, (%A)");
        }

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    public void writePushPop(Parser.CommandType command, String segment, Integer index) {

        if ( command.equals("")) {
            Error.error("Instrução invalida");
        }

        List<String> commands = new ArrayList<String>();

        if(command == Parser.CommandType.C_POP) {
            commands.add(String.format("; %d - POP %s %d", lineCode++ ,segment, index));

            if (segment.equals("constant")) {
                Error.error("Não faz sentido POP com constant");
            } else if (segment.equals("local") || segment.equals("argument") || segment.equals("this") || segment.equals("that")) {
                
                String base = "";
                if (segment.equals("local")) base = "$LCL";
                else if (segment.equals("argument")) base = "$ARG";
                else if (segment.equals("this")) base = "$THIS";
                else if (segment.equals("that")) base = "$THAT";

                commands.add("leaw " + base + ", %A");
                commands.add("movw (%A), %D");
                commands.add("leaw $"+index+ ", %A");
                commands.add("addw %D, %A, %D");
                commands.add("leaw $13, %A");
                commands.add("movw %D, (%A)");

                commands.add("leaw $0, %A");
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw (%A), %D");
                commands.add("leaw $14, %A");
                commands.add("movw %D, (%A)");

                commands.add("leaw $0, %A");
                commands.add("movw (%A), %D");
                commands.add("decw %D");
                commands.add("leaw $0, %A");
                commands.add("movw %D, (%A)");

                commands.add("leaw $14, %A");
                commands.add("movw (%A), %D");
                commands.add("leaw $13, %A");
                commands.add("movw (%A), %A");
                commands.add("movw %D, (%A)");
            } else if (segment.equals("static")) {
                commands.add("leaw $0, %A");
                commands.add("movw (%A), %A"); 
                commands.add("decw %A"); 
                commands.add("movw (%A), %D");
                commands.add("leaw $14, %A");
                commands.add("movw %D, (%A)");

                commands.add("leaw $0, %A");
                commands.add("movw (%A), %D"); 
                commands.add("decw %D"); 
                commands.add("leaw $0, %A");
                commands.add("movw %D, (%A)");

                commands.add("leaw $14, %A");
                commands.add("movw (%A), %D");
                commands.add("leaw $"+filename+"."+index+", %A");
                commands.add("movw %D, (%A)");
            } else if (segment.equals("temp")) {
                commands.add("leaw $0, %A");
                commands.add("movw (%A), %A"); 
                commands.add("decw %A"); 
                commands.add("movw (%A), %D");
                commands.add("leaw $14, %A");
                commands.add("movw %D, (%A)");

                commands.add("leaw $0, %A");
                commands.add("movw (%A), %D"); 
                commands.add("decw %D"); 
                commands.add("leaw $0, %A");
                commands.add("movw %D, (%A)");

                commands.add("leaw $14, %A");
                commands.add("movw (%A), %D");
                commands.add("leaw $"+(5+index)+", %A");
                commands.add("movw %D, (%A)"); 
            } else if (segment.equals("pointer")) {
                commands.add("leaw $0, %A");
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw (%A), %D");
                commands.add("leaw $14, %A");
                commands.add("movw %D, (%A)");

                commands.add("leaw $0, %A");
                commands.add("movw (%A), %D");
                commands.add("decw %D");
                commands.add("leaw $0, %A");
                commands.add("movw %D, (%A)");

                commands.add("leaw $14, %A");
                commands.add("movw (%A), %D");
                commands.add("leaw $"+(index==0?"THIS":"THAT")+", %A");
                commands.add("movw %D, (%A)");
            }
        } else if (command == Parser.CommandType.C_PUSH) {
            commands.add(String.format("; %d - PUSH %s %d", lineCode++ ,segment, index));

            if (segment.equals("constant")) {
                commands.add("leaw $"+index+", %A"); 
                commands.add("movw %A, %D");
            } else if (segment.equals("local")) {
                commands.add("leaw $LCL, %A"); 
                commands.add("movw (%A), %D");
                commands.add("leaw $"+index+ ", %A");
                commands.add("addw %D, %A, %A"); 
                commands.add("movw (%A),%D");
            } else if (segment.equals("argument")) {
                commands.add("leaw $ARG, %A"); 
                commands.add("movw (%A), %D"); 
                commands.add("leaw $"+index+ ", %A");
                commands.add("addw %D, %A, %A"); 
                commands.add("movw (%A),%D");
            } else if (segment.equals("this")) {
                commands.add("leaw $THIS, %A"); 
                commands.add("movw (%A), %D"); 
                commands.add("leaw $"+index+ ", %A");
                commands.add("addw %D, %A,  %A"); 
                commands.add("movw (%A),%D");
            } else if (segment.equals("that")) {
                commands.add("leaw $THAT, %A"); 
                commands.add("movw (%A), %D"); 
                commands.add("leaw $"+index+ ", %A");
                commands.add("addw %D, %A,  %A"); 
                commands.add("movw (%A),%D");
            } else if (segment.equals("static")) {
                commands.add("leaw $"+filename+"."+index+", %A"); 
                commands.add("movw (%A), %D");
            } else if (segment.equals("temp")) {
                commands.add("leaw $"+(5+index)+", %A"); 
                commands.add("movw (%A), %D");
            } else if (segment.equals("pointer")) {
                commands.add("leaw $"+(index==0?"THIS":"THAT")+", %A"); 
                commands.add("movw (%A), %D");
            }
            commands.add("leaw $0, %A"); 
            commands.add("movw (%A), %A");
            commands.add("movw %D, (%A)");
            commands.add("leaw $0, %A"); 
            commands.add("movw (%A), %D"); 
            commands.add("incw %D"); 
            commands.add("movw %D, (%A)");
        }

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    public void writeInit(boolean bootstrap, boolean isDir) {

        List<String> commands = new ArrayList<String>();

        if(bootstrap || isDir)
            commands.add( "; Inicialização para VM" );

        if(bootstrap) {
            commands.add("leaw $256,%A");
            commands.add("movw %A,%D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D,(%A)");
        }

        if(isDir){
            commands.add("leaw $Main.main, %A");
            commands.add("jmp");
            commands.add("nop");
        }

        if(bootstrap || isDir) {
            String[] stringArray = new String[commands.size()];
            commands.toArray(stringArray);
            write(stringArray);
        }
    }

    public void writeLabel(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add( "; Label (marcador)" );
        commands.add(label+":");

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    public void writeGoto(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Goto Incondicional", lineCode++));
        commands.add("leaw $"+label+", %A");
        commands.add("jmp");
        commands.add("nop");

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    public void writeIf(String label) {
        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Goto Condicional", lineCode++));
        
        commands.add("leaw $0, %A");
        commands.add("movw (%A), %A");
        commands.add("decw %A");
        commands.add("movw (%A), %D");
        commands.add("leaw $13, %A");
        commands.add("movw %D, (%A)");
        
        commands.add("leaw $0, %A");
        commands.add("movw (%A), %D");
        commands.add("decw %D");
        commands.add("movw %D, (%A)");
        
        commands.add("leaw $13, %A");
        commands.add("movw (%A), %D");
        
        commands.add("leaw $"+label+", %A");
        commands.add("jne %D");
        commands.add("nop");

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);
    }

    public void writeCall(String functionName, Integer numArgs) {
        
        String returnLabel = functionName + "$ret." + cont++;
        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - chamada de funcao %s %d", lineCode++, functionName, numArgs));

        commands.add("leaw $" + returnLabel + ", %A");
        commands.add("movw %A, %D");
        commands.add("leaw $0, %A");
        commands.add("movw (%A), %A");
        commands.add("movw %D, (%A)");
        commands.add("leaw $0, %A");
        commands.add("movw (%A), %D");
        commands.add("incw %D");
        commands.add("movw %D, (%A)");

        for (String seg : new String[] { "LCL", "ARG", "THIS", "THAT" }) {
            commands.add("leaw $" + seg + ", %A");
            commands.add("movw (%A), %D");
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("movw %D, (%A)");
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %D");
            commands.add("incw %D");
            commands.add("movw %D, (%A)");
        }

        commands.add("leaw $0, %A");
        commands.add("movw (%A), %D");
    
        commands.add("leaw $" + (numArgs + 5) +", %A");
        commands.add("subw %A, %D, %D");
        commands.add("leaw $ARG, %A");
        commands.add("movw %D, (%A)");

        commands.add("leaw $0, %A");
        commands.add("movw (%A), %D");
        commands.add("leaw $LCL, %A");
        commands.add("movw %D, (%A)");

        commands.add("leaw $" + functionName + ", %A");
        commands.add("jmp");
        commands.add("nop");

        commands.add(returnLabel + ":");
        write(commands.toArray(new String[0]));
    }

    public void writeReturn() {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Retorno de função", lineCode++));

        commands.add("leaw $LCL, %A");
        commands.add("movw (%A), %D");
        commands.add("leaw $13, %A");
        commands.add("movw %D, (%A)");

        commands.add("leaw $13, %A");
        commands.add("movw (%A), %D");
        for (int i = 0; i < 5; i++) 
        commands.add("decw %D");
        commands.add("movw %D, %A");
        commands.add("movw (%A), %D");
        commands.add("leaw $14, %A");
        commands.add("movw %D, (%A)");

        commands.add("leaw $0, %A");
        commands.add("movw (%A), %A");
        commands.add("decw %A");
        commands.add("movw (%A), %D");
        commands.add("leaw $ARG, %A");
        commands.add("movw (%A), %A");
        commands.add("movw %D, (%A)");

        commands.add("leaw $ARG, %A");
        commands.add("movw (%A), %D");
        commands.add("incw %D");
        commands.add("leaw $0, %A");
        commands.add("movw %D, (%A)");

        String[] seq = { "THAT", "THIS", "ARG", "LCL" };
        int offset = 1;
        for (String seg : seq) {
            commands.add("leaw $13, %A");
            commands.add("movw (%A), %D");
            for (int i = 0; i < offset; i++) commands.add("decw %D");
            commands.add("movw %D, %A");
            commands.add("movw (%A), %D");
            commands.add("leaw $" + seg + ", %A");
            commands.add("movw %D, (%A)");
            offset++;
        }

        commands.add("leaw $14, %A");
        commands.add("movw (%A), %A");
        commands.add("jmp");
        commands.add("nop");

        write(commands.toArray(new String[0]));
    }

    public void writeFunction(String functionName, Integer numLocals) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Declarando função %s %d", lineCode++, functionName, numLocals));
        commands.add(functionName + ":");
        for (int i = 0; i < numLocals; i++) {
            commands.add("leaw $0, %A");
            commands.add("movw $0, %D");
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %A");
            commands.add("movw %D, (%A)");
            commands.add("leaw $0, %A");
            commands.add("movw (%A), %D");
            commands.add("incw %D");
            commands.add("movw %D, (%A)");
        }
        write(commands.toArray(new String[0]));
    }

    private void write(String[] commands) {
        for (String command: commands) {
            this.outputFile.println(command);
        }
    }

    public void close() throws IOException {
        this.outputFile.close();
    }

    public void vmfile(String file) {
        this.filename = file.substring(file.lastIndexOf("/")+1, file.lastIndexOf("."));
    }
 }