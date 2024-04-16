Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5D23FC2
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 11:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713265283; cv=none; b=X/+coOffVzGgXVyrkXUyhM4TkAcD4nkxYOze1PrteKM+4PhY7X7eonEO7lnFWSc6c/bQUcXOLmJM6dqJnnx9nLUn5Jslqz+PdJR7thdTd7r005nb+Vo2CD7n7IwmM1HpjMN/pjpxwag2rfisi/hqMUtpPTmrTQmXcnlzmI2+qfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713265283; c=relaxed/simple;
	bh=rucFRDUwhz9mjFWRhohQGSaM+EbpELVZQbhGdj40ILk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubSRILRC6Zhw7huEqGeWcpmQMvAcCTdadpEJcKVGK4boWTvxOPUWBlvS3d7XYL0YgxXcHTpv8c4Gv9fpHcDIn57V9NEB19sTBE+eHZr/fUwN3+uO7hoG4gbIhXAQTgcsvcDi+rLyVIgAYSRRzPoO7lxhFA8Y6wX4HFyCFamOZTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzCnTUfb; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzCnTUfb"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2dae975d0dcso3122951fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 04:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713265280; x=1713870080; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ytr2gjGDi6MOUgYACZdiW0scYQdKsmNLgN4Zn17oOZo=;
        b=SzCnTUfbQeSkUwEyGAav5tNU0/i5nYcZgmQLAVF+pC7fb3SRHxfbfQjK+CVeypXfPX
         RBBuc1oy8XTR6HC2qp+wopjJo8berUEgnbPSgewZETbti4Vfs6JHUQbKzV5TJoQN0yZL
         mcRoPM/6xHYrC3e4dz6pVYFSq82xbcX8F0VsneF1nT0BKLiA+flSDHcjjSeqE12Al0Ni
         +NerGafyGTAnF577QjmKLLiWHmQAbIJBaA+4uPWMoJitygsKmndRoec9vExxdDxmPtmP
         ymTuY8GFjA4WzEUv+zNuvWxZcEs2aObj6ajQcn27wl8NQbSnjcwvon1JTW4+GNDoszXc
         V73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713265280; x=1713870080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ytr2gjGDi6MOUgYACZdiW0scYQdKsmNLgN4Zn17oOZo=;
        b=QBqD+yJlqhYzFzdy/8o/dc0JontrjKOE5CMYhdhojPAL6tanvBIvONXBoAMBi10Oo4
         C4o7HDNviU9GD0OV0awcREn7jvWEhG+7hw6K/hRNAHfkF8v9XO4NceforTW/yeyhHEEJ
         Yq324LLj7lZi8JCpUJvz+r2P+OkYgZBmHbb/NtMDA42X6dX4RaBPYVpiaQyI6gaJf6d6
         OH+qVTzduZVkAF3LJQTC/sflv957Ycbk9Zm+Mxra6xiiHDjgV+x+1n6so/JQi9NCkwzx
         BdDjjqL8jUiZAgYq8v2CXMQhoTyW5JDhppS2XwnzB18Zulb0C85zggkr121VNxAfNyBh
         Bddg==
X-Forwarded-Encrypted: i=1; AJvYcCXa1dvCIvWrdMYFt+Uv4SFvqQH6GosiJt4fNoYwRs4gX1kww1jAJ1UREop4Ks6/9hGGoZgTfNbRzpwoeWnsL174P5X9pF6QwY/ref0=
X-Gm-Message-State: AOJu0Yza/RSCnNDQaG03YLYdQu3iLgBexPy1EeX1E2rUg9FTjw2ZzDk4
	+0KNd+CWxOojWkfj7pulEEffoCalz6U1nGcAix27HMzz8Nkn2E0O
X-Google-Smtp-Source: AGHT+IG0D+e1m7dFn1q9C4/cK5VHSr2W95LT82IU7SVm/yesKp+FKUPQjomsggxh50eO2gSxhqVoAQ==
X-Received: by 2002:a2e:7406:0:b0:2d9:f301:9771 with SMTP id p6-20020a2e7406000000b002d9f3019771mr654146ljc.5.1713265280208;
        Tue, 16 Apr 2024 04:01:20 -0700 (PDT)
Received: from mobilestation ([213.79.110.82])
        by smtp.gmail.com with ESMTPSA id e8-20020a2e8ec8000000b002d860a40f9dsm1535007ljl.136.2024.04.16.04.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 04:01:19 -0700 (PDT)
Date: Tue, 16 Apr 2024 14:01:17 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Yanteng Si <siyanteng@loongson.cn>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Simon Horman <horms@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 4/4] net: stmmac: Move MAC caps init to phylink
 MAC caps getter
Message-ID: <uaq3tbsogvuv6vjm7ga63boltao2vvi55yzyw75z7yido2a5zr@h26npwx3pdwa>
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
 <20240412180340.7965-5-fancer.lancer@gmail.com>
 <9644a96d17152014c8e7f91e9786dde26f67d7a5.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9644a96d17152014c8e7f91e9786dde26f67d7a5.camel@redhat.com>

On Tue, Apr 16, 2024 at 12:27:29PM +0200, Paolo Abeni wrote:
> On Fri, 2024-04-12 at 21:03 +0300, Serge Semin wrote:
> > After a set of fixes the stmmac_phy_setup() and stmmac_reinit_queues()
> > method have turned to having some duplicated code. Let's get rid from the
> > duplication by moving the MAC-capabilities initialization to the PHYLINK
> > MAC-capabilities getter. The getter is called during each network device
> > interface open/close cycle. So the MAC-capabilities will be initialized in
> > normal device functioning and in case of the Tx/Rx queues
> > re-initialization as the original code semantics implies.
> > 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> 
> This is a net-next follow-up for the previous 3 patches
> targeting 'net', right?

Right. The last patch in the series is a cleanup patch which gets rid
from the duplicated code by moving it to the PHYLINK MAC-capability
getter.

> 
> If so, you should have posted this one separately after the other would
> have been merged back into net-next.

I thought about that initially. But since this patch content is
connected with the rest of patches and the maintainers/reviewers may
ask to do things differently than it's provided in the initial
patches, I decided to submit the entire series as is but indicating
that the last patch is intended for 'net-next'.

> 
> We can apply the first 3 to 'net', but you will have to repost 4/4
> after ~Thu.

Agreed. I'll repost 4/4 after the initial 3 patches get to be merged
in.

Thanks
-Serge(y)

> 
> Thanks,
> 
> Paolo
> 
