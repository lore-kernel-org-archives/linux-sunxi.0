Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E99D13C69B
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Jun 2024 08:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717747488; cv=none; b=ZUtTDXVldTkE/ILex5x0UoXvlT/UqSPwXVsrrEX+gnbdfX6w9pCbBBJxGawNxUZfqJPuXwpq4tIfqrKH0L18d5ROT28vkqLXvABHZ5R/r/iE49AyqVoNg8oaoLSOblZH5UlsSCxQL5forTM1FMLBCWza7LyGm8A1YLl21CODXg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717747488; c=relaxed/simple;
	bh=iRk1YNV1eMtLeNp3Te4u3uEFiIR1fWxkiAtwTd6JHN4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=G4bCfYXnlvLsSRWtw/S0tqpcHSsLlFq+gp+rvde8ufU6qtwoTPMCV+TBWjVt2W4JjtqEqRQKRq7tfFaXrDofYMul5aKGxAI7MrK5mhQiuGd2Hb1uHT5xGjK/uNPKjOsM8kcRjcctn8Nve4mncXYB4EOE0T+X3ojM7CP+tkauThM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REmb3svd; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REmb3svd"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a68b5f18fc5so207352766b.1
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Jun 2024 01:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717747485; x=1718352285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHTEB/VzVlwsDqiMfVQQnNEOGkiSg21MmPi/eavWhB0=;
        b=REmb3svdfznI/bpCp5Pe0jalhpkEXtb5aGztSQ/lVduJetV+CFSAsadOo3v6kvJO19
         O3AAhSi1XACnQLYoeyGTARJQDVEXPMDwvYWk8pIn4fzETiG1NHovS5kuJotRf67SiqA5
         kwwhhkLJHqodab1ybcRngvaq6nAY6QtOMw9H4zHcdJBsDGadQy2Te0AruMmCwHFSxiMC
         2pXEphVRzX4YGT4Oni9/YkFlttEx52/eBPDqoqbgDkdHF0pt44ZacUNIliZJZsM/0dhO
         a8lQsFGriGgogrQFHGh75qCFUrG2/JM11PnqbETG0oj8rIrsKoHZfpiLk+DaVfEuyBO5
         +wVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717747485; x=1718352285;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vHTEB/VzVlwsDqiMfVQQnNEOGkiSg21MmPi/eavWhB0=;
        b=HARffv54skfSETPsdEqpbWtWRPfRrKfwPYXVkXWh9KypNbAsGLOmPLK8Px4f4LUrnu
         W/Dhrwwy9A9yuClNq5ljlP8NapNaJLyIXr1lnewxTSFkAzUZCUSwzHTGQ493hJGzqrCc
         6xa+tB9nNz9K6YdNFfiuIUcsXDAWB3y9JTl3uEIZJc46qvLLHwnDlt4I6IHForxncIsd
         VjNEPmzssBHgwoVqV2N0nZKvnpXhjrXckyDAkZC3q60nAKf+HxLUYHbYgaKQUW8O1emu
         NS/BdJYCZp1PWtNIOF8InasgTbAUSKMWKH73fVKwdBfco0dojcC+KVkonOvg+LyNToQb
         530Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIWzREbn6uGWCyJfSVhbvEcpJ/z3XwRY5pk93FVjNgBlXUr82aWCyseRySB3DI6WTZb5kTlTjIagvSn212eIU9JFC7lzQytt1k1D0=
X-Gm-Message-State: AOJu0YxAK9/wH4yrQu2Mdah70BhxZ/v+IWsE/L5kwSjalNcw1ZsTKfEc
	JCNvzmbEK20hS6ALH8hg3pxxTctdzSiD+huAf7MOA1YUZ+Iu6vyy
X-Google-Smtp-Source: AGHT+IExgnAQUcrdORoGg6TV/9qPh9JBwUAmzwB2cHbzIem0i3Xhw9fMo2vk9TjEW4CIT6IHMAkpMg==
X-Received: by 2002:a17:907:7211:b0:a6e:a97c:fc9a with SMTP id a640c23a62f3a-a6ea97cfd20mr31412166b.8.1717747485112;
        Fri, 07 Jun 2024 01:04:45 -0700 (PDT)
Received: from localhost (host-95-246-50-43.retail.telecomitalia.it. [95.246.50.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c84aa8351sm183122066b.142.2024.06.07.01.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 01:04:44 -0700 (PDT)
Date: Fri, 07 Jun 2024 10:04:43 +0200
From: Matteo Martelli <matteomartelli3@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Matteo Martelli <matteomartelli3@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Marcus Cooper <codekipper@gmail.com>, 
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
 linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Message-ID: <6662bf1b61bbc_2f51737023@njaxe.notmuch>
In-Reply-To: <20240606-savvy-wallaby-of-champagne-d4a50e@houat>
References: <20240529140658.180966-2-matteomartelli3@gmail.com>
 <20240529140658.180966-3-matteomartelli3@gmail.com>
 <20240606-savvy-wallaby-of-champagne-d4a50e@houat>
Subject: Re: [PATCH 1/1] ASoC: sunxi: sun4i-i2s: fix LRCLK polarity in i2s
 mode
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Maxime Ripard wrote:
> > -	/*
> > -	 * DAI clock polarity
> > -	 *
> > -	 * The setup for LRCK contradicts the datasheet, but under a
> > -	 * scope it's clear that the LRCK polarity is reversed
> > -	 * compared to the expected polarity on the bus.
> > -	 */
> 
> I think we should keep that comment somewhere.

I think that keeping that comment would be very misleading since the LRCLK
setup would not contradict the datasheet anymore [1][2].

Also, do you recall any details about the mentioned scope test setup? Was i2s
mode tested in that occasion? It would help clarify the situation.

Could anyone verify this patch against H3/H6 SoCs?

[1]: https://linux-sunxi.org/images/4/4b/Allwinner_H3_Datasheet_V1.2.pdf
section 8.6.7.2
[2]: https://linux-sunxi.org/images/4/46/Allwinner_H6_V200_User_Manual_V1.1.pdf
section 7.2.5.2

Thanks,
Matteo Martelli
