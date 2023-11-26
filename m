Received: from work.electricworry.net (unknown [90.216.236.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E6346AD
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Nov 2023 11:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=electricworry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=electricworry.net
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from BOB1 (localhost [127.0.0.1])
	by work.electricworry.net (Postfix) with ESMTPS id 7D433D8932C;
	Sun, 26 Nov 2023 11:45:58 +0000 (GMT)
Date: Sun, 26 Nov 2023 11:45:55 +0000
From: Bob McChesney <bob@electricworry.net>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mikhail Kalashnikov <iuncuim@gmail.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Vignesh R <vigneshr@ti.com>, Jaehoon Chung <jh80.chung@samsung.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/3] sunxi: H616: Add OrangePi Zero 3 board support
Message-ID: <ZWMv816r8YxPwsJO@BOB1>
References: <20231114013106.31336-1-andre.przywara@arm.com>
 <20231114013106.31336-4-andre.przywara@arm.com>
 <0eab5c21-4fdc-478e-9071-f43c12e01fb3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0eab5c21-4fdc-478e-9071-f43c12e01fb3@gmail.com>

On Sat, Nov 25, 2023 at 08:43:12PM +0300, Mikhail Kalashnikov wrote:
> Tested-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> On 14.11.2023 04:31, Andre Przywara wrote:
> > The OrangePi Zero 3 is a small development board featuring the Allwinner
> > H618 SoC, shipping with up to 4GB of DRAM, Gigabit Ethernet, a micro-HDMI
> > connector and two USB sockets.
> > The board uses LPDDR4 DRAM and an X-Powers AXP313a PMIC, support for
> > which was recently added to U-Boot.
> > 
> > Add a defconfig file selecting the right drivers and DRAM options.
> > Since the .dts file was synced from the Linux kernel repo already, we
> > just need to add one line to the Makefile to actually build the .dtb.
> > 
> > The DRAM parameters were derived from the values found in the BSP DRAM
> > drivers on the SPI NOR flash.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >   arch/arm/dts/Makefile            |  1 +
> >   board/sunxi/MAINTAINERS          |  5 +++++
> >   configs/orangepi_zero3_defconfig | 30 ++++++++++++++++++++++++++++++
> >   3 files changed, 36 insertions(+)
> >   create mode 100644 configs/orangepi_zero3_defconfig

Tested-by: Bob McChesney <bob@electricworry.net>

Am I ok to just tag onto Mikhail's email to add my tested tag? I've got
a 4GB Orange Pi Zero 3 and can confirm that it works, despite any
limitations that may be present.

Regards,
Bob

