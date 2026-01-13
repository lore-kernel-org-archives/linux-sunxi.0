Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D93926ED3E
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Jan 2026 01:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267348; cv=none; b=NZl7IDOzJFUgvE7uC50tBL+ZjM4j26RQ1jg+HQjmCLM9zJWNS8LK9+07M0rFSqjoZQdNcOFB4S87uCj8+b2zwAZWXZ4fnn3QEcN8utzmqRg1M3GtfZqtpyPWlZbmWWTFgowEcGC+UABotNJkNcK6NkSOZGl2eGR54R5NB+o6J48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267348; c=relaxed/simple;
	bh=9jcki0VwFivzUKZrK8pWrRDJYWKcuJLyXI+FehZc280=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qggazFqX7pz0MLkXPzliZ+7K4g0kVVLVONkwzshMipezYjx835682aczSThsP3hDQ0yPrgnLOfx8qU3Pr7f6ZStwpmu226frKB10zLC0BYN9WTg88+bfoKcR/Utd4fulRsoojG9x9vQQ2b8lAbIpVJqEA0P9LSfj71rh4lLTXgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 54A253415D9;
	Tue, 13 Jan 2026 01:22:25 +0000 (UTC)
Date: Tue, 13 Jan 2026 09:22:20 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
	Jagan Teki <jagan@amarulasolutions.com>,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 02/10] sunxi: spl: a733: config text and stack address
Message-ID: <20260113012220-GYA24058@gentoo.org>
References: <20251130-01-a733-soc-support-v2-0-18bdd4376fad@gentoo.org>
 <20251130-01-a733-soc-support-v2-2-18bdd4376fad@gentoo.org>
 <20260102014033.26410b4c@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102014033.26410b4c@minigeek.lan>

Hi Andre,

On 01:40 Fri 02 Jan     , Andre Przywara wrote:
> On Sun, 30 Nov 2025 21:45:11 +0000
> Yixun Lan <dlan@gentoo.org> wrote:
> 
> > Add some ciritial SPL settings for A733 SoC
> > 
> > - Set SPL MAX SIZE to 180KB, 0x47000 - 0x74000
> > - Set SPL running address to 0x47000, with a header padded before
> >   the image, so the final SPL text address need to shift 0x60 bytes.
> > - Set Stack address
> 
> The patch separation for those addresses looks a bit arbitrary, since
> there are other SPL specific addresses in patch 01/10, and we don't
> really support an SPL anyway.
strictly, we still need SPL stage, for cpu to fully switching to 64bit
mode, as the initial brom/boot0 are running in 32bit, also currently I
rely on SPL to chainload u-boot image with CONFIG_SPL_RAM_DEVICE support.

and yes, the only missing part is DDR initialzation in SPL..

> So either drop this patch, or merge it into the previous one.
> 
I will merge them into previous patch, thanks

> Cheers,
> Andre
> 

-- 
Yixun Lan (dlan)
