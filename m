Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55F02F29
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Feb 2022 15:28:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEF051396;
	Fri,  4 Feb 2022 07:28:18 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F1B03F774;
	Fri,  4 Feb 2022 07:28:17 -0800 (PST)
Date: Fri, 4 Feb 2022 15:28:14 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Icenowy Zheng
 <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>, Simon Glass
 <sjg@chromium.org>, Samuel Holland <samuel@sholland.org>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Chris Morgan
 <macroalpha82@gmail.com>, George Hilliard <thirtythreeforty@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: Pull request: u-boot-sunxi/master for 2022.04 (part 2)
Message-ID: <20220204152814.0df7aa31@donnerap.cambridge.arm.com>
In-Reply-To: <20220204130711.GO7515@bill-the-cat>
References: <20220204013311.3235-1-andre.przywara@arm.com>
	<20220204130711.GO7515@bill-the-cat>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 4 Feb 2022 08:07:11 -0500
Tom Rini <trini@konsulko.com> wrote:

Hi Tom,

> On Fri, Feb 04, 2022 at 01:33:11AM +0000, Andre Przywara wrote:
> 
> > Hi Tom,
> > 
> > this is the promised second part of the sunxi PR for 2022.04, albeit
> > technially outside of the merge window. We were working on this full
> > steam since the beginning of the year, and it deserves to be merged,
> > I think.
> > The main attraction is support for the F1C100s SoC, which sports a
> > venerable ARM926 core. Support for this SoC and the LicheePi Nano board
> > has been in Linux for years, and U-Boot patches were posted mid last
> > year already.
> > The new SoC using ARMv5 also means that the bulk of the new code should
> > not touch any existing boards, although we did some refactorings first,
> > of course, which actually cleans up some existing sunxi code.
> > 
> > Compile tested for all 160 sunxi boards, and briefly tested on BananaPi M1,
> > OrangePi Zero, Pine64 and Pine-H64. Tested by others on their boards,
> > including F1C100s and F1C200s devices.  
> 
> So, this failed CI at first because of no MAINTAINERS entry for
> 'licheepi_nano' but I've fixed that up.  As a custodian, you can turn on
> CI runs for the sunxi tree by, and I don't have the reference at hand
> sorry, going through the project menu under settings -> ci/cd and
> enabling group runners.

Ah, sorry for that. I now did as you said, also manually triggered a CI
run, and see the failing MAINTAINERS check now. So many thanks for fixing
this up! I also pushed some test branch and see the CI being triggered, so
hopefully I will spare you with those hiccups in the future.

Cheers,
Andre


> That said:
> 
> > ======================================
> > The following changes since commit 006fddde01da7e8b3c7cad4a35f3245edc894ab4:
> > 
> >   Merge https://gitlab.denx.de/u-boot/custodians/u-boot-fsl-qoriq (2022-02-02 09:16:49 -0500)
> > 
> > are available in the Git repository at:
> > 
> >   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
> > 
> > for you to fetch changes up to b6ffd58e45043b822844345d4ca9b2cb1e2917b7:
> > 
> >   configs: sunxi: Add support for Lichee Pi Nano (2022-02-04 00:09:57 +0000)  
> 
> Applied to u-boot/master, thanks!
> 

