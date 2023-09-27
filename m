Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5513133F1
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Sep 2023 10:00:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 815C61FB;
	Wed, 27 Sep 2023 03:01:21 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB11B3F59C;
	Wed, 27 Sep 2023 03:00:41 -0700 (PDT)
Date: Wed, 27 Sep 2023 11:00:32 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Okhunjon Sobirjonov <okhunjon72@gmail.com>
Cc: bigunclemax@gmail.com, cfsworks@gmail.com, jagan@amarulasolutions.com,
 jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev, samuel@sholland.org,
 u-boot@lists.denx.de, uwu@icenowy.me, Okhunjon Sobirjonov
 <Okhunjon.Sobirjonov@Mec-electronics.com>
Subject: Re: sunxi: introduce NCAT2 generation model
Message-ID: <20230927110032.5b9a69e1@donnerap.manchester.arm.com>
In-Reply-To: <20230927094252.61765-1-okhunjon72@gmail.com>
References: <20230721134606.4505-9-andre.przywara@arm.com>
	<20230927094252.61765-1-okhunjon72@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 27 Sep 2023 12:42:52 +0300
Okhunjon Sobirjonov <okhunjon72@gmail.com> wrote:

Hi,

> When NCAT2 generation model's introduced for t113,
> the modification in drivers/mmc/sunxi_mmc.c
> > + IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2)) && (sdc_no == 2))  
> in struct mmc *sunxi_mmc_init(int sdc_no) seems to have
> some negative side effects, meaning enabling 8-bit mode for MMC2.

"Some negative side effects" sounds cute, but it actually breaks it ;-)

> Paticularly,  IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2)
> should not be used for D1/T113 
> since there is not support for 8-bit mode for MMC2 yet.
> Therefore, the solution would be to drop this particular
> change entirely.

So yeah, that line is just plain wrong, it seems like all the NCAT SoCs we
have seen (D1/T113/R329) do no support 8-bit eMMC.

So thanks for the heads up, I will remove that line from v2.

> Signed-off-by: Okhunjon Sobirjonov <Okhunjon.Sobirjonov@Mec-electronics.com> 

S-o-b:'s are only needed for actual patch submissions, not for comments on
the list.

Cheers,
Andre
