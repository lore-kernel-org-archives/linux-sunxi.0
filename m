Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864873D7C
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Sep 2022 14:24:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9AA21576;
	Wed, 14 Sep 2022 07:24:11 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FDC13F73D;
	Wed, 14 Sep 2022 07:24:04 -0700 (PDT)
Date: Wed, 14 Sep 2022 15:24:00 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, U-Boot
 Mailing List <u-boot@lists.denx.de>
Subject: Re: [PATCH 1/2] sunxi: Kconfig: use SoC-wide values for some
 symbols
Message-ID: <20220914152400.1e9fe273@donnerap.cambridge.arm.com>
In-Reply-To: <20220914140444.GQ6993@bill-the-cat>
References: <20220913233217.24717-1-andre.przywara@arm.com>
	<20220913233217.24717-2-andre.przywara@arm.com>
	<20220914140444.GQ6993@bill-the-cat>
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

On Wed, 14 Sep 2022 10:04:44 -0400
Tom Rini <trini@konsulko.com> wrote:

Hi Tom,

> On Wed, Sep 14, 2022 at 12:32:16AM +0100, Andre Przywara wrote:
> 
> > Some configuration symbols formerly defined in header files were
> > recently converted to Kconfig symbols. This moved their value definition
> > into *every* defconfig file, even though those values are hardly board
> > choices.
> > Use the new Kconfig option to define per-SoC default values, in just one
> > place, which makes the definition in each defconfig file redundant.
> > 
> > We refrain from setting a sunxi specific value for CONFIG_SYS_BOOTM_LEN,
> > so this defaults to a much better 64MB for uncompressed arm64 kernels.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> Note that you forgot to CC the U-Boot list on this series.
> 
> Reviewed-by: Tom Rini <trini@konsulko.com>

Many thanks! And yeah, I realised that missing CC: afterwards, and sent it
again, just to the list this time. CC:ing now to record your tag.

Cheers,
Andre
