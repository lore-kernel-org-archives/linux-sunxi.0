Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D2B12882D
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 11:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713267514; cv=none; b=Io0McgZe34q/xbxGWm1/CXm67Ut2vQ7EXCO2+/eNaBqDzhBJxCqk/3TWVT78pzogzMOmi2ZAASXVse904L8kvWNu1/SmJKxTPXrO8UkjqAZiomw4nMRyOnLKr7p0MoH4OvmcianEgp9lnFRSgKd6ALY4WkbCkmsWACjetVqggGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713267514; c=relaxed/simple;
	bh=NIRfjbxBKlUF6UYKXQ9bPrhaNs+Ht9ITk6Oi0xFaqV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aH0FHOolsv45f7veyorFFr1BbjmOB5Z0DsUk58Q7TNJNfAwwATF+7x/Mb00nP4aHFMDR7+3v0OjoFa4g7UPUcpuDVft5piFxzUu+nojAd766KHTho2G0lFJvQFsE2SIRhvcKpmxljpl8BGcrlWKWSHfnXoGvpCfm+ckx2uoNiuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlqozUKR; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlqozUKR"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so5205525e87.2
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 04:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713267511; x=1713872311; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3imXpN/x1JQtEA6zkUwudIXWS06IjOEYxP3aQIvEud0=;
        b=MlqozUKRkriQ593p8lKdpEbZoWyNLDWAgOag4bQe2IYvHu4gOHrfrbYTkKFSIFN/Vw
         +JsWfX8WzJO27wK/YjyxqfNusaVu6BxtXaddFUY5LAscwZ1ZuDLkqmcRY9fSJka6fYQt
         1lcrYUqanyEeqNkFeYEuO8C+hyXtyWPh0r3XuE8wVJqGD+7RpvVka1MfL0HHGdOIoOlH
         nJ4rf1jwQsB2mju+P3ntEUJaPAtnPex2oIPwITn7X5cBBcVlWG+HZqcYB46q/kPeCH2/
         MFwwoC13atsfkY4lz6cHANeqbSirufd1Hsv92IUWwjRdRS3LqaU/NElDJSUO8j4ZwNgm
         U0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713267511; x=1713872311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3imXpN/x1JQtEA6zkUwudIXWS06IjOEYxP3aQIvEud0=;
        b=W1/eyumdyeuiJ2LNLPgfs6hLLucFRRJlDphWvyMm2P372CwcfdN7u3fhGAGDpp5Tso
         XzcqSrpz/nonHTpXJPJG+jVlXXt06e7oVt4fcmjcctSP/CStzMPZUSYA01scQmSgY8zw
         msrqFu6fuoKWr7I4il7MOntR36nhiUR+nLzRPqJm0XZjMzcBTs/mtXaUg53qSUOriDMr
         sTOWRG6ZgNMHxnSdW9pyFXmzg627jCTVvPA7bBvLajqSvnkZohbtC1SSgshs4oRCrzWv
         bGTZ0mWwDUQlumw+WoykEjX/nsCu6xqO/6/7lSk7hg+vUXcRjzEa26NF5IOgt0+vuvIg
         bOIw==
X-Forwarded-Encrypted: i=1; AJvYcCWMRlIDa9I7acQoTIqb/a0EKza+0WGaXT2vzH9/Z/e57A7oYAgn+w92B8KOy0m/upwDWLnyT7TU7LcGz8bUDeoV+8Gs/9O/OoLWIDg=
X-Gm-Message-State: AOJu0YyBBPRu7T+H5yrN4c3WfnFku+q4unT1NLsXUEcEzK7v3I0A3O6W
	mMxTShxgLIbNST1l4LQbKG190fWtZ93BkbreqD0+YFna396Cbqyt
X-Google-Smtp-Source: AGHT+IFsv1t50cVsn9xtvOjs4g4KFGJI0LdCIc6Wa6MGsoQY1SUEtRqNz2Pjjzjb2zJlDyUmdLuf3A==
X-Received: by 2002:ac2:528c:0:b0:518:7e4a:2035 with SMTP id q12-20020ac2528c000000b005187e4a2035mr7410480lfm.45.1713267510734;
        Tue, 16 Apr 2024 04:38:30 -0700 (PDT)
Received: from mobilestation ([213.79.110.82])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056512159600b00518e96b85b0sm568727lfb.234.2024.04.16.04.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 04:38:30 -0700 (PDT)
Date: Tue, 16 Apr 2024 14:38:28 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
	Yanteng Si <siyanteng@loongson.cn>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Simon Horman <horms@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 4/4] net: stmmac: Move MAC caps init to phylink
 MAC caps getter
Message-ID: <btgxb3ugs4apjvxj5hmpec3rtoxwdal7ms2z4s7pecdfefphiw@gd7ctqsh7wg2>
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
 <20240412180340.7965-5-fancer.lancer@gmail.com>
 <714199e5-edf2-dcbb-216b-563431d70488@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <714199e5-edf2-dcbb-216b-563431d70488@bootlin.com>

Hi Romain

On Tue, Apr 16, 2024 at 09:56:32AM +0200, Romain Gantois wrote:
> Hi Serge,
> 
> On Fri, 12 Apr 2024, Serge Semin wrote:
> 
> > +static unsigned long stmmac_mac_get_caps(struct phylink_config *config,
> > +					 phy_interface_t interface)
> > +{
> > +	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
> > +
> > +	/* Get the MAC-specific capabilities */
> > +	stmmac_mac_phylink_get_caps(priv);
> 
> This is a bit of a nitpick, but the terminology is quite confusing between 
> stmmac_mac_phylink_get_caps() and stmmac_mac_get_caps().

Right, the naming turns to be ambiguous "a bit".)

> Ideally, we could just 
> get rid of the whole stmmac_do_void_callback() complexity and just call 
> phylink_get_caps() directly.

No, this isn't a good solution. The local coding convention implies
using the macro-functions implemented to execute the callbacks. We
can't use the macros everywhere but in this place.

> In the meantime, maybe renaming this to 
> stmmac_mac_core_get_caps() would be acceptable?

The name was selected to align with the rest of the PHYLINK callbacks:

static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
        .mac_get_caps = stmmac_mac_get_caps,
        .mac_select_pcs = stmmac_mac_select_pcs,
        .mac_config = stmmac_mac_config,
        .mac_link_down = stmmac_mac_link_down,
        .mac_link_up = stmmac_mac_link_up,
};

So I don't think that changing it to something different would be a
good alternative. What could be a better option is to rename the
stmmac_ops::phylink_get_caps() callback and
stmmac_mac_phylink_get_caps() macro-function to something like:

stmmac_ops::link_update_caps()
stmmac_mac_link_update_caps()

especially seeing the callback no longer sets the phylink MAC
capabilities directly. What do you think?

-Serge(y)

> 
> Please let me know what you think.
> 
> Thanks,
> 
> -- 
> Romain Gantois, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
