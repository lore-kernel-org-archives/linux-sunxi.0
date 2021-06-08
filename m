Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1DE70
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jun 2021 15:32:07 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7F6FC68B05; Tue,  8 Jun 2021 17:32:03 +0200 (CEST)
Date: Tue, 8 Jun 2021 17:32:03 +0200
From: 'Christoph Hellwig' <hch@lst.de>
To: David Laight <David.Laight@ACULAB.COM>
Cc: 'Christoph Hellwig' <hch@lst.de>, Guo Ren <guoren@kernel.org>,
	Nick Kossifidis <mick@ics.forth.gr>,
	Drew Fustini <drew@beagleboard.org>,
	Anup Patel <anup.patel@wdc.com>,
	Palmer Dabbelt <palmerdabbelt@google.com>,
	"wefu@redhat.com" <wefu@redhat.com>,
	Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
	Guo Ren <guoren@linux.alibaba.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Benjamin Koch <snowball@c3pb.de>,
	Matteo Croce <mcroce@linux.microsoft.com>,
	Wei Fu <tekkamanninja@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210608153203.GA6802@lst.de>
References: <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com> <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de> <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com> <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr> <CAJF2gTTpSbNWS4VLHAu4XsV5-Vos=6R9MmPOx8-yzMFJu=wX4A@mail.gmail.com> <a8f2e68dcc1a6eb1ff3b95fcb8d0d0d2@mailhost.ics.forth.gr> <CAJF2gTQuQ5bE6HeGSoNaDynA0o3+KEo4snwft42YGzE=+DjKOQ@mail.gmail.com> <20210607062701.GB24060@lst.de> <2db975b5f24149b19191120b9f0f506b@AcuMS.aculab.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2db975b5f24149b19191120b9f0f506b@AcuMS.aculab.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jun 08, 2021 at 03:00:17PM +0000, David Laight wrote:
> It is almost impossible to interface to many ethernet chips without
> either coherent or uncached memory for the descriptor rings.
> The status bits on the transmit ring are particularly problematic.
> 
> The receive ring can be done with writeback+invalidate provided you
> fill a cache line at a time.

It is horrible, but it has been done.  Take a look at:

drivers/net/ethernet/i825xx/lasi_82596.c and
drivers/net/ethernet/seeq/sgiseeq.c
