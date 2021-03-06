#!/usr/bin/perl -w  
 
use Tk;
use strict;
use Math::Trig;
use Tk::DialogBox;
use Tk::JPEG;
use Tk::Dialog;
use strict;
use Data::Dumper;
#code to print a dialog message window
#$mw->optionAdd('*font', 'Courier 14');
#my $d=$mw->Dialog(-title => "Error!!", -text => "Error. Enter Valid Math Statement. \n Would you like to try again?",
#-buttons => [ qw/ Yes Cancel / ]);
#if ($d->Show eq "Yes") {
#  halt();
#  }
#

##### MAIN WINDOW CREATION ##########
my $mw = MainWindow->new;
$mw->geometry("600x600");
$mw->Label(-text => 'Perl Calculator')->pack;
$mw->optionAdd('*font', 'Courier 35');
my $textvar = 1;
my $entry = $mw->Entry(
                       -validate => 'key', #Check for Key Stroke
                       -validatecommand=> #subroutine below executes when key stroke pressed
                       sub {
                            # Does String Contain Numbers
                            if ($_[0] =~ m/[0-9]*/) {
                                # Check if Letters are used
                                if ($_[0] =~ m/[a-zA-z]/) {
                                    # Check if the following valid operators are used
                                    if ($_[0] =~ m/sin\(/
                                        || $_[0] =~ m/cos\(/
                                        || $_[0] =~ m/tan\(/
                                        || $_[0] =~ m/sqrt\(/
                                        || $_[0] =~ m/exp\(/
                                        || $_[0] =~ m/log\(/
                                        || $_[0] =~ m/\^\(/)
                                    {
                                        return 1;
                                    }
                                    else {
                                        $mw->optionAdd('*font', 'Courier 14');
                                        my $dialog=$mw->Dialog(-title => "Error!!", -text => "Error. Enter Valid Calculator Math Statement. \n Please try again.",
                                            -buttons => [ qw/ Okay / ]);
                                        if ($dialog->Show eq "Okay") {
                                            return 0;
                                        }
                                    }
                                }
                                return 1;
                            }
                       },
                       -width => 20) -> pack;

##### CALCULATOR LAYOUT SETUP ########
my $calculator = $mw->Frame()->grid(
    -row => 5,
    -column => 5
);

#### BUTTON LAYOUT ############
$calculator->Button(
    -text => '(',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '(') },
)->grid(-row => 3, -column => 2);

$calculator->Button(
    -text => ')',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), ')') },
)->grid(-row => 3, -column => 1);

$calculator ->Button(
    -text => '1',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '1') },
)->grid(-row => 4, -column => 0);

$calculator ->Button(
    -text => '2',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '2') },
)->grid(-row => 4, -column => 1);

$calculator ->Button(
    -text => '3',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '3') },
)->grid(-row => 4, -column => 2);

$calculator ->Button(
    -text => '4',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '4') },
)->grid(-row => 4, -column => 3);

$calculator ->Button(
    -text => '5',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '5') },
)->grid(-row => 5, -column => 0);

$calculator ->Button(
    -text => '6',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '6') },
)->grid(-row => 5, -column => 1);

$calculator ->Button(
    -text => '7',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '7') },
)->grid(-row => 5, -column => 2);

$calculator ->Button(
    -text => '8',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '8') },
)->grid(-row => 5, -column => 3);

$calculator ->Button(
    -text => '9',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '9') },
)->grid(-row => 6, -column => 0);

$calculator ->Button(
    -text => '0',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '0') },
)->grid(-row => 6, -column => 1);

$calculator ->Button(
    -text => '.',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '.') },
)->grid(-row => 6, -column => 2);

$calculator ->Button(
    -text => '',
    -width => 3,
    
)->grid(-row => 6, -column => 3);

$calculator->Button(
    -text=> 'sin',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), 'sin(') },
)->grid(-row => 2, -column=> 0);

$calculator->Button(
    -text=> 'cos',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), 'cos(') },
)->grid(-row=> 2, -column => 1);

$calculator->Button(
    -text=> 'tan',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), 'tan(') },
)->grid(-row=> 2, -column => 2);

$calculator->Button(
    -text=> '/',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '/') },
)->grid(-row=>3, -column => 4);

$calculator->Button(
    -text=> '+',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '+') },
)->grid(-row=>4, -column => 4);

$calculator->Button(
    -text=> '-',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '-') },
)->grid(-row=>5, -column => 4);

$calculator->Button(
    -text=> '*',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '*') },
)->grid(-row=>6, -column => 4);

my $clear = $mw->Frame()->grid(
    -row=>1, 
    -column=>3,
    );

$clear->Button(
    -text=> 'Clear',
    -width => 9.5,
    -padx => 18,
    -command => sub{ 
        $entry->delete(0, length($entry->get))
    },
)->grid(-column=>1, -row=>0);

$calculator->Button(
    -text=> "exp",
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), 'exp(') },
)->grid(-row=>3, -column=>0);

$calculator->Button(
    #will do natural Log in perl
    -text=>"log",
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), 'log(') },
)->grid(-row=>2, -column=>3);

$calculator->Button(
    -text=>"sqrt",
    -width => 4,
    -command => sub{ $entry->insert(length($entry->get), 'sqrt(') },
)->grid(-row=>2, -column=>4);

$calculator->Button(
    -text=>"^",
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '^(') },
)->grid(-row=>3, -column=>3);

####### LOGIC ########
$clear->Button(
    -text=> 'Enter',
    -width =>10,
    -padx => 20,
    -command => sub{
        my @temp = split(/(\()|(\))|(\*)|(-)|(\+)|(\/)|(\d+\.?\d*)|(tan)|(sin)|(cos)|(exp)|(ln)|(sqrt)|(^)|/,$entry->get);
        my @equation;
        my $trigFlag = 0;
        my $trigParenCounter = 0;
        my $maxTrigParen = 0;
        
        foreach(@temp){
            if($_){
                if($_ eq "^"){
                    push @equation, "**";
                }else{
                    push @equation, $_;
                    if($_ eq "tan" or $_ eq "sin" or $_ eq "cos"){
                        push @equation, "(deg2rad";
                        $trigFlag = 1;
                        $trigParenCounter += 1;
                        $maxTrigParen += 1;
                     }
                      if($_ eq ")" and $trigFlag == 1){
                        $trigParenCounter -= 1;
                        if($trigParenCounter == 0){
                            while($maxTrigParen > 0){
                                push @equation, ")";
                                $maxTrigParen -= 1;
                            }
                        }
                    }
                }
            }
        }    
        my $problem = "";
        foreach(@equation){
             if($_){
                 $problem .= $_;
             }
        }
        
        # If problem can be evaluated, do so. Otherwise, Error Message.
        if (my $result = eval $problem) {
            $entry->delete(0, length($entry->get));
            $entry->insert(0, $result);
        } else {
            $mw->optionAdd('*font', 'Courier 14');
            my $dialog=$mw->Dialog(-title => "Error", -text => "Invalid Operation. \n Please try again.",
                -buttons => [ qw/ Okay / ]);
            if ($dialog->Show eq "Okay") {
                return 0;
            }
        }
    },
)->grid(-column=>3, -row=>0);

########## ENGINE ############
my $cols;
my $rows; 
($cols, $rows) = $calculator->gridSize();
for(my $i = 0; $i < $cols; $i++){
    $calculator->gridColumnconfigure($i, -uniform => 1);
}
$clear->pack(-anchor => 'nw');
$calculator->pack(-anchor => 'nw');
MainLoop; 