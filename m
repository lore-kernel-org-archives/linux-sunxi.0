Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1921322F
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Apr 2022 23:02:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE5A723A;
	Tue,  5 Apr 2022 16:02:25 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B66D43F718;
	Tue,  5 Apr 2022 16:02:24 -0700 (PDT)
Date: Tue, 5 Apr 2022 23:41:35 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Simon Glass <sjg@chromium.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Samuel Holland <samuel@sholland.org>, Tom Rini <trini@konsulko.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/4] mkimage: sunxi_egon: add riscv support
Message-ID: <20220405234135.5716de2f@slackpad.lan>
In-Reply-To: <20210619091838.646779-1-icenowy@aosc.io>
References: <20210619091838.646779-1-icenowy@aosc.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Jun 2021 17:18:34 +0800
Icenowy Zheng <icenowy@aosc.io> wrote:

> This patchset tries to make mkimage -T sunxi_egon to be able to generate
> an eGON.BT0 image for Allwinner RISC-V SoCs (e.g. D1).
> 
> In addition, to keep the compatibility, it will still consider the
> architecture to be ARM when no architecture is specified.

All merged into sunxi/master (which already landed in mainline).

Thanks!
Andre

> 
> Icenowy Zheng (4):
>   mkimage: add a flag to describe whether -A is specified
>   mkimage: sunxi_egon: refactor for multi-architecture support
>   mkimage: sunxi_egon: add support for riscv
>   sunxi: specify architecture when generating SPL boot image
> 
>  scripts/Makefile.spl |  2 +-
>  tools/imagetool.h    |  1 +
>  tools/mkimage.c      |  1 +
>  tools/sunxi_egon.c   | 86 ++++++++++++++++++++++++++++++++++++++++----
>  4 files changed, 82 insertions(+), 8 deletions(-)
> 

