Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715B7385D7E
	for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607642; cv=none; b=eDbc36BdqNcANbAwzOpf963mpup7GjzJzRT8B+SQxv5uaz28ucguEwVGl22Ql1SgHXQzQl7/58uG3DsO5VaWKz+j9M1LF+OeQW9XPyIU/cn46Z07M+SuZioGSRX8X26GA6ZxAKQ8sAjZ4s8RfvL/zI+tzk6GYch/Yrr7kU5x9hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607642; c=relaxed/simple;
	bh=vGG4nd1YAIYov5qTt5rE96b8JQO3OTkdN9hNK+VyXDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uRw8GCtq3KQoW4fkGqNe1xLjmpoxDxwwY9m5JnHRflw7M4P4NzXBIlbY0PbGN8VAxrVNlZW43r6S71bcG7CP1x8BKhs3M9/Iw5wRRKQ9tIchJa/BGUJ/BNUbnO4ckOdannVku2T3Zv6aB3E/nBWWs9HUr2j/MrvPqzNbQTVFOCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+y/4AZg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+y/4AZg"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so5389159f8f.2
        for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 10:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778607640; x=1779212440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGG4nd1YAIYov5qTt5rE96b8JQO3OTkdN9hNK+VyXDI=;
        b=F+y/4AZgSRtkq0bWGyHea6h+2AOcW3kx1bPm8Ow10hb51qd+9W4MQ5jMttIlabgEIx
         24kSS47lXSQAn8EYmQvagbM/tI0YCHpFpeaCg6P9593cep24aRwnL79g9Njq/Z+TqApG
         Gh9q2qVNFAfT29wDyiSyE96BsWXenYtE/nerDfwz8KXZCCtbOSJBsv3iIcgVCefUhphx
         UBsBsgXxPtysBvKSMxCd2ebeTK6JEnp1YWJeyAFyxSQLQNLeW4VxNerIuYsxG65D14uW
         cQAL0UYh7hAUMvmpKv62qS6XgcDasgm8Pah/oTJv3d6hblS8s31S2SAnhiFJZ8Vg78/P
         kHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778607640; x=1779212440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vGG4nd1YAIYov5qTt5rE96b8JQO3OTkdN9hNK+VyXDI=;
        b=XoUVkOUPC2O5PTKR9RYuSwv+G3835XT23Q+DDXVp5agRWGRO8sNGD2u5gI2Tl69yfK
         BfpGf7UTrHwoMLRBdy3eyPj/PHUIFOvcBdIZ1Ez5ZZ/QnvAY2FguksmmYLcmrjLVvdAd
         je2IRQHUAQy9ZmZvlitz7K4Tq0IpgXVaMRBWRHD1xZ0MTF2+/fqj5e1iUap5Lc34VnWS
         rgIeDXWWrzeNIrzP6y3/ri9V2Wxtg16f0h4FFLDV1OrD5CXX3Ow33BjijZdtxqZUF96k
         9MRx2MQpaACSooG8fogiZ7GAqqOYMz5MScqAJ7myST6CHLGjPaSKIED7lR8lGEcBYlWf
         Acpg==
X-Forwarded-Encrypted: i=1; AFNElJ+HqX0gqT0UI2X2g2hD0aqgoeufSc+6HrAGaSmxB3u/EN4v3F2/FaOALElMQHI8Begj4bkDSp35GcNiQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOM4Kr+YfCDZD0ePP/aeSXxLEbh32NR/hlv98dlFzIFu/y/QF6
	EIspbiGUokmVCno3Ie6FEVle9uHwEQmjrzNiZe0AHw9XsWVcvf2edIyL
X-Gm-Gg: Acq92OHw7KGL4QaS27qund4/tlmVIFDSB15RkrLY5ho0udmhALRK7d5TzzpLNd6jZaL
	7WsLyVVtYbNAhzgwRHYJHI9/4cQnO2KNL/KQqh2fGsybmvLqUaZr3qZJkeiHYyv0GzR/GQSA/z2
	IPX3e4JprDMouVBGWtdYBQGifxyOOL1tFjxy5Taxn0Thz1F1Q1UVE2MVg0xuXWSVeGlNoZipPhI
	W8Eun1Jxx93AfbjsWSrwJHGyNPiHJkoDHXesv3ZiewjSDEHRDJnC3KBSbZbej2FbKeR6pGdv+4k
	jWFsePeeOG0VrTucK0QnXBa/mJRwR0J/6sVR5qjR9srJHAjdHDELwu80bLY/gd2aWJXtFOVD+WU
	yiZkwv4ljTS6eE2Z11Ek8O1b48B9eRHq+xBcv6GpeVfcEySIfLe1ia4R2rnVts8ooA/gixXyXo+
	RHZdIv68OFFplcknUBCwY4G7TZzmaVlBPSCXipVynCLAGt+lrThJUTY0diPm4FR30NuE2VybLnQ
	wBkqkPcrnAa5T1ypQ==
X-Received: by 2002:a5d:5f82:0:b0:44e:1984:5f3e with SMTP id ffacd0b85a97d-456a46e8db9mr22611150f8f.31.1778607639664;
        Tue, 12 May 2026 10:40:39 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-458b3664e3esm18557218f8f.3.2026.05.12.10.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:40:39 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Chen-Yu Tsai <wens@kernel.org>,
 Paul Kocialkowski <contact@paulk.fr>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 5/5] sunxi: configs: OrangePi 4A: enable SPI
Date: Tue, 12 May 2026 19:40:38 +0200
Message-ID: <tA1cgZu-TL-SYDNUTTFndQ@gmail.com>
In-Reply-To: <20260511213713.15943-6-andre.przywara@arm.com>
References:
 <20260511213713.15943-1-andre.przywara@arm.com>
 <20260511213713.15943-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 11. maj 2026 ob 23:37:13 Srednjeevropski poletni =C4=8Das j=
e Andre Przywara napisal(a):
> The OrangePi 4A board ships with SPI NOR flash, so enable the SPI and
> flash drivers, also the SPL version, for SPI booting.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


