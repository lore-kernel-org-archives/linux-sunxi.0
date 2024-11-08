Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61D51E0E10
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Nov 2024 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731066852; cv=none; b=JS/zdc4WdbhOzeThmuy7wPjC1tmsErmfgCj/NE/bOdj3VQGpZRZ6BKCe4rWVcqDJV7gTWVw79mGtL1aknXgaWTisQrk5HJi8Oq+cgfDoKmp6D33CYtqmExPO2MQ6p5PVfkjeTzyYAh3BSbGLdB6tDtBicsGJtkpfwaRXxNq5MCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731066852; c=relaxed/simple;
	bh=dXsnSzpSmH7jFj3r6IUkN9EYqxfdRkJtNVjFdOUOiZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EVm9AJL3M1cqrRYYCh4QYPh5ABuIk/ycdBH4beiW0XL2LI8hQjnM1Z4Z8m+uiXp2e0s/4roLGX4FBTVdsAjwKqmKeI5tmPVVbNcTY97r/U+O4wk4cEGdXXL4nmjJKX4oyxUwKOujBH2drthqYxk2n732H91+Qm3XpxCjYtHRy3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94034339;
	Fri,  8 Nov 2024 03:54:32 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 678283F528;
	Fri,  8 Nov 2024 03:54:00 -0800 (PST)
Date: Fri, 8 Nov 2024 11:53:57 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: John Watts <contact@jookia.org>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
Message-ID: <20241108115357.691b77b0@donnerap.manchester.arm.com>
In-Reply-To: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
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

On Fri, 08 Nov 2024 12:40:16 +1100
John Watts <contact@jookia.org> wrote:

Hi John,

thanks for taking care and sending a patch!

> On the D1 and T113 the TCON TOP cannot handle setting both DEs to a
> single output, even if the outputs are disabled. As a workaround assign
> DE1 to TVE0 by default.

Can you say *why* this patch is needed? Is there something broken that
needs fixing? Where does this show and why wasn't this a problem before?

> A full fix for this would include logic that makes sure both DEs never
> share the same output.

To be honest, given the isolation on this patch, I'd rather wait for this
full fledged solution, especially if there is no pressing need (see above).

> Signed-off-by: John Watts <contact@jookia.org>
> ---
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> index a1ca3916f42bcc63b9ac7643e788d962ef360ca8..543311ffb1509face3fbfd069ded10933f254b9d 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> @@ -179,7 +179,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
>  	 * At least on H6, some registers have some bits set by default
>  	 * which may cause issues. Clear them here.
>  	 */
> -	writel(0, regs + TCON_TOP_PORT_SEL_REG);
> +	writel(0x20, regs + TCON_TOP_PORT_SEL_REG);

Sorry, but that looks weird:
First, please explain the 0x20. Is it bit 5? If yes, what does that bit
mean? The commit message suggests you know that?

And second: the comment above clearly states that those two writes just
*clear* some registers, to have some sane base line. So please adjust this
comment, and copy in some of the rationale from the commit message.
Explaining things in the commit message is good (so thanks for that!), but
having at least some terse technical explanations near the code, in a
comment, is better.

Cheers,
Andre

>  	writel(0, regs + TCON_TOP_GATE_SRC_REG);
>  
>  	/*
> 
> ---
> base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
> change-id: 20241108-tcon_fix-f0585ac9bae0
> 
> Best regards,

