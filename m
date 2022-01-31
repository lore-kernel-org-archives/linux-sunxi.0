Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1C22CA4
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 02:05:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D00EEED1;
	Sun, 30 Jan 2022 18:05:00 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 979163F774;
	Sun, 30 Jan 2022 18:04:59 -0800 (PST)
Date: Mon, 31 Jan 2022 02:04:27 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jesse Taube <mr.bossman075@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, George Hilliard
 <thirtythreeforty@gmail.com>, Chris Morgan <macroalpha82@gmail.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, linux-sunxi
 <linux-sunxi@lists.linux.dev>
Subject: Please test U-Boot Allwinner F1C100s support
Message-ID: <20220131020427.2e57f75d@slackpad.fritz.box>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

thanks to the tireless work of Jesse, I think the basic Allwinner
F1C100s support for mainline U-Boot is now ready to be merged. Since I
don't have the hardware, can any of you who have boards please give it a
try on their hardware? I would really love to see some confirmations
before I merge it.
I put a branch here:
https://source.denx.de/u-boot/custodians/u-boot-sunxi/-/tree/f1c100s

This should probably work on any F1C100s board, using the LicheePi Nano
defconfig. Also curious about the F1C200s (looking at you, George ;-)

This is very basic support at this point, there is no USB or SPI
support, and even the SD card is not usable from U-Boot proper. I am
hopeful we can add MMC and SPI support still in this cycle, but I don't
want to hold back this series any longer, and it should be relatively
simple support patches.

What should work though is booting via FEL and from SD card (the SPL
MMC code is in place, if I am not mistaken). Just booting it to a U-Boot
prompt via both methods would be a great test already. Maybe you can
even upload a kernel and initrd via FEL and boot it from there, using
$fdtcontroladdr for the DT address, for instance.

Any replies would be highly appreciated!

Many thanks,
Andre
