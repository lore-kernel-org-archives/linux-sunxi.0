Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F9F39EF18
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715714; cv=none; b=o1oZDLH4iOgmeCQQq/n3mz8Ls7dG14oFb0da3pR4PIgpiV7rIUrqF0ie/kcIa4S7es7PJBeezkiA+jJ+F4W9+5dV3EnqPhmuYmJBEG0cifJl72T5DlTDq2qfuvXDlfGEPMNC9Mr1YgZzvgh89a/mtb5IGAI0Uhk7lawvR0GfUp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715714; c=relaxed/simple;
	bh=mzxuHFEBJ8rIbeR5gmZexUBLMULkEpRVqRmwwCFyU/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htrkm7Rh2SjVBdpLtkUzohfD5uLM+ksyoLffbaPN8wlOJ0uFGnwa/M0RX5ajy9uFcq9Aok/6BYP9Eim3RF0gZnOPrBZfM3hVjwt/hrE/diL4hUeQ/6PgqdRym+MqoISxjzt6vZ7XDewDAcXcP3tBKwnoAaJEbjId5wNXUuR9w6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ae43042ea7so53425205ad.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Mar 2026 05:01:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715713; x=1773320513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IxpxVkGnClS/pzWnTPcTEx+bl+pPZR21vGpLksfVXc=;
        b=hjks2O5801UIleENWbUReUGY2rkfEDz7hqgO4K5pViZnent6u5KAgzxKvnOqYS75eQ
         qKtg8JnCdpjiloGAF9R8td+Jzi8VuWhKo9FRmwTMCNOVOFOXXFvEY3gXIY6F+TtGbK9U
         IczfHQcsLFHJ1p6JuEskf8C6iteretO2Bz6FUHaB2I87NoSfJAgBNCj6FUILboW0PN7N
         8UIPMTJoeA6+2Mc52JzLNQCCv9Rn3+sJzQlq7X8xzyERwPgb1HXkGwE+JMKQNlDhn1ZY
         vVbq9HkmmFHKsfEb+ll2PB7r2ENpGlIZjDenZ7wasg3YKcjSmB2XFS+iUlk0xdwKBXYS
         WGsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLflA932QEQELhbnyGj+IV1G9FlaB9AsVe+wP5V2lGRd+PSaJdUtNjjqO6JLyz64eckq+dYC8DFGyKVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYw2uTn+a2ORlQtjC9bFXZXpx3ZbPShibBwrTnpkj3uWNalfi9
	t7zGo2BWFX5KWbreR+s9QSSEdAxp+NZzzLKLi1mc+RTriuOGVn4SzRRY
X-Gm-Gg: ATEYQzwP4HngF/Kl39qWRhUThlEyqkWrsxNaMcBvzBRpGzHbfmFbcgj6lZZj3RrNBCC
	CSJ2WyFd8vwifhz3Rn9N+Oh0LePXuwE7DuLGd99xZTG4cT574XyCY7iY4w6Z1aOR7zYGCiYLtzV
	PUubJGGnexWGHHmw88mZGxNlDRVQUVz8OZZItEpt/4xsjjapTnFjhULFOJepQHHhlMtCMc1QY+c
	OKvpNdSXma32Ju3gXsgrtpwWROK7AEE0OELrIYLWOu3uZKruMao3RzUxNNKZaVquTHMK1d3Maor
	58qcYBLJ8KI9uKzMyFch75ptXM3LegNUajb3G6SZ9Jkpe0pr//EtYIC8Ye9X/tYPvhbJ+MUoZa9
	fiqTgBZ9R5WqudwhlK1gS2Z3l7WGa60vwyxvDH7MuNsrw0St4m1Ej5IuATuvEDV2AWBuRSreifR
	Ce5ORm3cmBmK78h12u6DLUJUq+7ONF2JxTGQh5FRPOfX3cgMAfR2623U5QnGnyrBaItjz4taWKI
	Wd0VDF0TmTuPOQ0eug/EGbsouD2rLk8CZMyTjxg/iB/OTd9UjullVhVgdIb2A==
X-Received: by 2002:a17:902:ce03:b0:2ae:5b52:3818 with SMTP id d9443c01a7336-2ae6a9deb2amr60551085ad.8.1772715711782;
        Thu, 05 Mar 2026 05:01:51 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae54136b28sm115696425ad.73.2026.03.05.05.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:01:50 -0800 (PST)
Date: Thu, 5 Mar 2026 22:01:49 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305130149.GA1659133@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305122957.GA1652563@rocinante>
 <20260305123956.ojkt4k3ly64xz7fu@skbuf>
 <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>

Hello,

> > > For content match, it could also be:
> > > 
> > >   K:    phy
> > > 
> > > I believe this would match everything of interest?
> > 
> > Yeah, and way more. Think USB PHY, network PHY, etc. Don't want to drown
> > the linux-phy mailing list in unrelated patches, either.
> 
> Also phylink, any memory management / DMA stuff that happens to mention
> "physical", and probably numerous other examples.

Makes sense!  Sorry for the commotion here, then. :)

	Krzysztof
