Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D72B221546
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Nov 2025 22:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764541211; cv=none; b=O1SX8BUV7719RPszSZj/K7Li2qVB1pcKLcLZZ8Gbkaqr9y4KNftGc9IWj0V9qrpvZW/mbWTrVEC/A9pPYrMnzfKU4DN21A1LTJoW6dyJOYdJdXPN0+e8dL5ZW63nmucLAUYfpG8D/ucMKiqSjvscGyqs3RzP/xml+5SiK7HvOH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764541211; c=relaxed/simple;
	bh=7R9D7REYN31xwKSO6ozuFLFllu5NtYaMbSuqmC84S2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8hOvFBO5t6FYMEcwYjegr2wdcqKubjgKCR5hfglv/rncU+l+O7K/wc1516lEZwp7Ph+1fpG62Yrw2tfzNJvj7XQsZj/ASbnh4Quw7J0yK9GvW1JR0iyCH6VSgoFgu3wmIW61Jb3JdkvLTlB6r5HFbKZwXjR2VmAPukUwaABmF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 19B97340F37;
	Sun, 30 Nov 2025 22:20:08 +0000 (UTC)
Date: Mon, 1 Dec 2025 06:20:04 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 06/10] gpio: a733: add initial support
Message-ID: <20251130222004-GYA1814866@gentoo.org>
References: <20251130-01-a733-soc-support-v2-0-18bdd4376fad@gentoo.org>
 <20251130-01-a733-soc-support-v2-6-18bdd4376fad@gentoo.org>
 <CAOMZO5BG63ndAg7yTdMtBi7nHQjCGcrS9Sr0M5XfAiBkrC-oAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5BG63ndAg7yTdMtBi7nHQjCGcrS9Sr0M5XfAiBkrC-oAA@mail.gmail.com>

Hi Fabio,

On 19:09 Sun 30 Nov     , Fabio Estevam wrote:
> On Sun, Nov 30, 2025 at 6:47 PM Yixun Lan <dlan@gentoo.org> wrote:
> 
> > +config SUNXI_NEW2_PINCTRL
> 
> This name is not very descriptive.
> 
> What about SUNXI_A733_PINCTRL?

I'm open to this, but want to know Andre's suggestion about this,

The idea here I've chose a common one which follow old convention
and hope to re-use in future generation SoC..

-- 
Yixun Lan (dlan)
