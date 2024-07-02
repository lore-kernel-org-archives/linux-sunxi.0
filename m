Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717FA1BBBDD
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jul 2024 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719933441; cv=none; b=Ga1INSoYB42hzfbU/Do3xjiPuz8jMJt1ack02MHEvOLcUX6OnLS5jD0uAByRkeKpik3jmCUE6R9RtUWojI9d5VLcYqjxDBu0IXaEG0tcP9k8KQOTAs+VdBdVnui4J570Gdz4rum4Qf75DSyM4TcJoapZzcGpHnvtjBX/pEvfht8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719933441; c=relaxed/simple;
	bh=OH+FK15Szq9dfSrBQy16ayM0LYVw6SUGzokx5M9tzy8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=tftu+s+ejywW+gFLJMfI0Te3I/4cCoQIBz9G6hcVF4ep5hH3TUI2I9HhoJiRs3MEZjntYWP6TQ5HVBwsU1rA2Wlsw8uCQ6CTKx860pAKfPcEVxwThh6ssv61xyq5yF0Awv67p/f3mb8O3WgjWMN3bnfZk3zQCf/KjeKYMH9b6QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/38YCB+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/38YCB+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-424ad289912so30641195e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jul 2024 08:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719933438; x=1720538238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7xByIbV2umIoygttU7Su2ntwwqoRDPa8Pnvxm3eHlc=;
        b=Z/38YCB+bpghHhuem1zrt4u4ekBMFV3VZ5Uwi8agBWl+C0q+GmrBdw1UcrMJaNM9r7
         fpsXPPh0zqa0xZhqUCx7kYBdAZfXLbnis5EtZNtSeNlk62h3095fUiQ9U17fTzXocZdW
         dI2F5myFxWDzyJCZnmvEL5P61bJavE3J9g5Knr6je4MVXNTAhm7E9UfpP4cJ9FFUF4yj
         fVUggJX4jkVRMKIgCwdXBeogHvYpys4xSdMKXwd+c/Xy6Em5SAg9E/KZmylcJgoIhrwq
         VcFHns1OUmEJGYj52GxW+Ffe9dgwubvpskBMiaiHohqKHE+9hEc+sQuvKy6oNUaiWAok
         Y0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719933438; x=1720538238;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t7xByIbV2umIoygttU7Su2ntwwqoRDPa8Pnvxm3eHlc=;
        b=vfXKJ00mIklPLX+v7E8aJKNqYo+Soxw0sC2FIoVtxilpUM8yYsuoKoVzsZsv3pywIP
         VVl44Uy6sSCaSfKjlzealAyTFKW+bMeu+bwmHiHmtJHipd7ISZjkg7Hw1HnfIfHNLtT7
         U1n4s9Dhx96KX+YuTmUXI6EXnbINKzAWXH/j3GTTwbbaXhLWe0fgvKaMkAOQ8muaOu8y
         ayixJsHnf684cMChg9cai1/cCH26DpgKzD3bIPonzherrjx8orRhRv+V1g0VWYWFNyNs
         l2EFLOlTsqYbMJb71ohw5qZBg4SMOy+/TUN9t0a+MIqw085aJK5Cl5KbfToqtQ71dOqg
         aDVA==
X-Forwarded-Encrypted: i=1; AJvYcCV0TQV4xZxYxoTPA4PmwLRiVRT4vW+xd1FwWyMe8O4em7OFSJHwyASWSuigIzjB86MqH80ntv0MRoscEd8nXSN0i3uwUvEFgrA+AwQ=
X-Gm-Message-State: AOJu0YziPd6KmD0KveMClpCF+7OO6wAn1AvD990I2fL6ukCGJPcu5FDx
	e8HY4QWyLO91uUt3x1tQaWFGH6IkIQNnXkqR/UD04CiRGQDtioeu
X-Google-Smtp-Source: AGHT+IGX4cMz2AKxR9UquQ5Q7gBmz158IKH0vcsGbbVsGmFToi6f21HaHfYS04B91Tgb0Y7+kQ1CNw==
X-Received: by 2002:a05:600c:3b09:b0:424:7bcf:2486 with SMTP id 5b1f17b1804b1-4257a00aadamr54017895e9.4.1719933437469;
        Tue, 02 Jul 2024 08:17:17 -0700 (PDT)
Received: from localhost (host-95-246-50-43.retail.telecomitalia.it. [95.246.50.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b068e54sm205410225e9.25.2024.07.02.08.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 08:17:17 -0700 (PDT)
Date: Tue, 02 Jul 2024 17:17:15 +0200
From: Matteo Martelli <matteomartelli3@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
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
Message-ID: <668419fb8ef9f_2a76d370f1@njaxe.notmuch>
In-Reply-To: <20240702-copperhead-of-unusual-intensity-7f43a8@houat>
References: <20240529140658.180966-2-matteomartelli3@gmail.com>
 <20240529140658.180966-3-matteomartelli3@gmail.com>
 <20240606-savvy-wallaby-of-champagne-d4a50e@houat>
 <6662bf1b61bbc_2f51737023@njaxe.notmuch>
 <20240702-copperhead-of-unusual-intensity-7f43a8@houat>
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
> Hi,
> 
> On Fri, Jun 07, 2024 at 10:04:43AM GMT, Matteo Martelli wrote:
> > Maxime Ripard wrote:
> > > > -	/*
> > > > -	 * DAI clock polarity
> > > > -	 *
> > > > -	 * The setup for LRCK contradicts the datasheet, but under a
> > > > -	 * scope it's clear that the LRCK polarity is reversed
> > > > -	 * compared to the expected polarity on the bus.
> > > > -	 */
> > > 
> > > I think we should keep that comment somewhere.
> > 
> > I think that keeping that comment would be very misleading since the LRCLK
> > setup would not contradict the datasheet anymore [1][2].
> >
> > Also, do you recall any details about the mentioned scope test setup? Was i2s
> > mode tested in that occasion? It would help clarify the situation.
> 
> I can't remember if I tested i2s, I think I did though. But most of the
> work was done on either TDM or DSP modes, and I remember very clearly
> that the LRCK polarity was inverted compared to what Allwinner documents.
> 
> So the doc was, at best, misleading for these formats and we should keep
> the comments.
> 
> Maxime

Thanks for the reply Maxime, would you be able to point out the Allwinner
document part that is (or was) misleading? The current datasheets (see links
[1][2]) look correct, the current driver setup for TDM and DSP modes respects
those datasheets and it's not "reversed compared to the expected polarity on
the bus" as the comment states. Also I didn't find any related errata in their
changelog. Could it be possible that during those mentioned tests you were
still referring to the datasheets of other SoCs like A10 for instance? Or maybe
that the misleading information was in another document rather than the main
datasheets? If that's the case, would you still think that the comment should be
kept as it is?

[1]: https://linux-sunxi.org/images/4/4b/Allwinner_H3_Datasheet_V1.2.pdf
section 8.6.7.2
[2]: https://linux-sunxi.org/images/4/46/Allwinner_H6_V200_User_Manual_V1.1.pdf
section 7.2.5.2

Thanks,
Matteo
