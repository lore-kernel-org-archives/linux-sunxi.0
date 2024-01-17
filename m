Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C645428DA2
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Jan 2024 21:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705528035; cv=none; b=KEHuE1M1o92ZjkjW9jOC3HOHyFI6Zmy3ckhQWpu+f9bXqtspy+V2h33/8txc1XNXex2lHzFBzWvmxorW98f3qZ0j4EKIWNkKd4P+dCnSo0WjYQffw5KGsEuFAg6wDKWEeqpuPKVXbPIAvxhZi5ntd7xwkIYxBNOgnq+4Etfs0ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705528035; c=relaxed/simple;
	bh=4jZmSqPCgQuCB6hyoUi2Djqjlis6x1J38a0Zx2ZEbVc=;
	h=Received:Received:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:Organization:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=ZRUXJ7EujudPLfLgtwYmKqS8mqCj96JwJUL18R9NX72caO/U0uRLovj1j8baZhq82H5+Oa6kcm+DUVgcBVUH88MONNpizWN7ajFutbq2zSdOko2Mk+CYpUMDoRq9JnKozlOoQvPhwDAO6v0Vn/u2mFgbxRA2vb0mx9b/C3mhu1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEA3A11FB;
	Wed, 17 Jan 2024 13:47:58 -0800 (PST)
Received: from minigeek.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 236683F73F;
	Wed, 17 Jan 2024 13:47:12 -0800 (PST)
Date: Wed, 17 Jan 2024 21:46:27 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Nick Alilovic <nickalilovic@gmail.com>
Cc: u-boot@lists.denx.de, jagan@amarulasolutions.com,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] configs: Transpeed 8K618-T: Add Transpeed 8K618-T
 board support
Message-ID: <20240117214627.63964221@minigeek.lan>
In-Reply-To: <20240117163756.63875-2-nickalilovic@gmail.com>
References: <20240117163756.63875-1-nickalilovic@gmail.com>
	<20240117163756.63875-2-nickalilovic@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Jan 2024 11:37:56 -0500
Nick Alilovic <nickalilovic@gmail.com> wrote:

Hi Nick,

thanks for sending this!

> This is a Chinese TV box based on Allwinner H618 SoC.
> 
> The DRAM parameters were derived from the values found in a firmware update.
> 
> This patch will add transpeed-8k618-t_defconfig to the configs directory.

This last sentence is a bit out of place, the typical tone in a commit
message is to "direct the repository to make a change", so you use an
imperative. But it's more directed to the human reader of course, so
you don't need to replicate details like the exact filename, that are
spelt out three lines below here. So just a simple:

Add the defconfig file.

would suffice.

> 
> Signed-off-by: Nick Alilovic <nickalilovic@gmail.com>
> ---
>  configs/transpeed-8k618-t_defconfig | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 configs/transpeed-8k618-t_defconfig
> 
> diff --git a/configs/transpeed-8k618-t_defconfig b/configs/transpeed-8k618-t_defconfig
> new file mode 100644
> index 0000000000..7090577199
> --- /dev/null
> +++ b/configs/transpeed-8k618-t_defconfig
> @@ -0,0 +1,25 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_SUNXI=y
> +CONFIG_DEFAULT_DEVICE_TREE="sun50i-h618-transpeed-8k618-t"
> +CONFIG_SPL=y
> +CONFIG_DRAM_SUN50I_H616_DX_ODT=0x03030303
> +CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
> +CONFIG_DRAM_SUN50I_H616_CA_DRI=0x1f12
> +CONFIG_DRAM_SUN50I_H616_TPR0=0xc0001002
> +CONFIG_DRAM_SUN50I_H616_TPR10=0x2f1107
> +CONFIG_DRAM_SUN50I_H616_TPR11=0xddddcccc
> +CONFIG_DRAM_SUN50I_H616_TPR12=0xeddc7665
> +CONFIG_MACH_SUN50I_H616=y
> +CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
> +CONFIG_DRAM_CLK=648
> +CONFIG_R_I2C_ENABLE=y
> +CONFIG_SPL_I2C=y
> +CONFIG_SPL_SYS_I2C_LEGACY=y
> +CONFIG_SYS_I2C_MVTWSI=y
> +CONFIG_SYS_I2C_SLAVE=0x7f
> +CONFIG_SYS_I2C_SPEED=400000
> +CONFIG_SUPPORT_EMMC_BOOT=y

You correctly mention this, but miss the required MMC controller number:

CONFIG_MMC_SUNXI_SLOT_EXTRA=2

> +CONFIG_AXP313_POWER=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_AXP_DCDC3_VOLT=1360

This line belongs a few lines up. There is some non-obvious order of
those lines, which you can obtain by running "make savedefconfig" after
"make transpeed-8k618-t_defconfig". This will create a "defconfig"
file, which contains the minimal defconfig, in the right order. This
will be done routinely on all files in the configs/ directory
eventually, but it's good measure to get this right from the beginning,
to reduce churn.

You are also missing:
# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
which is somewhat mandatory on all Allwinner boards.
I don't actually remember why exactly, but we have this for almost
every sunxi board.

Thanks,
Andre
