Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802850;
	b=3SIE7leuwwg7ozcv+czHSLWuZxQKYs/0u3nYoy2zwvs+6ZGsc6/kZcjBOukiJnnTXjlL
	 7DygYVKuiVhmPdVvrYV0ROG4HkFpbbBP15XB/bbeFOBLEAvAuvZfFWd6++AYU46rFTExm
	 8WxnejbCTXen0JdGxQhpR16foKRaT3cdxXz4vjBL6s1W0vrF+5bCloA56KD0JDKOTXUlk
	 Ri5SU6xX/6mvPUW2IWBaXV/YkopXh0cZjgtT/udb8j2zTZP90IaQmprzd9bfLxhz0mMuI
	 1gRgLdLtuRu3kMROVGBZZZ59NJmuwHqTIYpDC498+/UdKBW2p74P0CZHqmk5H94Joeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=o6iub5dfPtfYhqcnzYk69opOns13WbIa7n9pOYTKOVw=;
	b=nfjzUwYkpJIi6jOY8X44enIoHGZd94Rg39ZchGAit50jVLRbSuw8rrfuf+9fhgajf3OH
	 Za79jd5vcNT4GrqGOvdJFluTTWhUBWiyC9LSKFi8MkJHFhY0wy8WdVTMEm7y3S9HANtmo
	 CQfEkqGZTHhlGoJemhQnD3RvoukdTrgU/zyHtTrueB4Gmzq56Sd8d0fq09dcil20Bdu7C
	 tN1ixNRJv51uHSw+1Dd3QLQJR9yKX6L1tfz2d+QO9QaGkLyn797OSv7HM1Q7th6ihCaS1
	 2afOuWjdFVrLhK7sS5qNE7WpvYj9IkWwxoMA6iOovLy6JHLVJX+SOXI6PwzsbVqtl+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bjP8nLCW;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB816606A33B
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 18:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB816606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bjP8nLCW
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-862df509ccbso4190087a34.2
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 10:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802849; x=1796407649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6iub5dfPtfYhqcnzYk69opOns13WbIa7n9pOYTKOVw=;
        b=bjP8nLCWq59fMLmR7+wRIlciDkrQCcFyrVe2n6iW4M68XD+VW11wy5KUB9XVscQo4o
         c2smRT7VKGPOVAHuK7Iemny6NIam7DvVRMDAxgmAVnVHX1fy3gS8+osXrW0sQ2u+ZB0g
         UlV7Rmv7umSWuaM4XGC8++yEv8r9+2tQ6YLzK7rtjLWvHARsbeQBYEAyAokkK/AfLFKL
         tMnSbxzA62UVT9p3AuAQnyuP8Gtz/zu/hNnWUruFnMT4nBCOdLQYTRSbPZB1i1md/+gK
         ljifdIgPkjFVz9S6Xzf0cVCgTe/j9IiADDGWgnlDeKVLcmS2SLG7kck5VCfhj/kL00IN
         Zpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802849; x=1796407649;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6iub5dfPtfYhqcnzYk69opOns13WbIa7n9pOYTKOVw=;
        b=Yd8nRbP49Blx9qROb+T5Z7H9kv6KHIPWT4EjJ97KPBz6zo/3s/+bfLQs2Rh7Q0P+Sp
         xYy45B+uWc5A55NQkvBWYgy/RSPmCJDqmEzsJfqxJwO53tAP60i9twF0Wu5t3/lNS9xp
         D+Tt8zQ6e48pHB2ymySoiKxo0qtcle+GqvBH+8u3tc22xNEx5rfdxOFYsmY53A+A98U0
         hPd+UWnXlarIFp3VnZI0+PTaQicIoNjF1cELPNN/E6vkt49nkcBXlV1gmZ8wWcxV1BKz
         pwsdW9284oulienNP+KT5NyPM5aOqPkFeJEbG//9qhzwgQKSvC8M847VmL0LfYG/KgTp
         K/iA==
X-Forwarded-Encrypted: i=1; AL+hErF3KErxcIKM3A2w+3jv4Kf8Tz1WBFFatyT8WiavzB7O283Fwss6xAZRSrMDpO98+sYUQitg10y81vwX3A==@lists.linux.dev
X-Gm-Message-State: APuU4Z8G+z0PhDggReyRQZj3F7YibYxKsYXfl0h7FwOqW1OGvAzI8tJF
	pscrq2v94MZF/PFjehvGsvTk2c6Bx+TONYb0ziFUfgoEMG5mtai3grEi
X-Gm-Gg: AZFdTZdQ1rzq40Ip/wM17wqD0fOR6twxMIntjZK3RsKbJuJB2t3Bo3MJO0RRICDLbHy
	Ph3cAguXfWRT2q9RAxoTiEnK59fOrUeizH49uBSJhZ5RdLbG/CCWhVvpqTgVIxGJIxAVwsvrtlN
	3b2sDR5WCZVBKv58jNaQbgjRnItrvV5sv8iyVH/kjjwGQ0tIQmSbhoo6ZKgi9ODMP8AUNRqPqVg
	/rV7yeHyV5Ywv5j10BhQVEjMY8MHr8igmci+VhYeQOijIFPTwUEi6zd1SLhcjRzb0PLSlxarKfX
	gtfgGBzBDNGzNY00h0BqedrgAD4wcAwHtiqBXypFQvVzcSfANvyTApTIX0I1YeywFNIhnlg8tnn
	I4TBDVNyE+hprjKZH2vYl6XJ3RMiWN7NgbBqZB04da5KgYV7bpIONES695eiujiViGSZfslx0aA
	bDbLPXXL1wZN70iBaO++iwwzzeI7z2YjyZnZ7pU2vxUqvOcXFrw3s3aiF/+HB37g6EUBhCcwJvO
	QiFdCGCDoebj6f0JCszf9L0UNZhCpX/NbFUfvB16F7ClX30fBHpA5ZMsGAL/7CdLGnf/XDiD3u+
	cI1sSZUtm3TtkOKCfZxfm0NKD1CrzVYo7HGJOrurGQ5SbaJgxJRtYBLC09KfgjRs4UtfA3bye8m
	ATEm3Sw==
X-Received: by 2002:a05:6830:230d:b0:862:9fb5:82a7 with SMTP id 46e09a7af769-86315979712mr26463348a34.21.1795802848575;
        Fri, 27 Nov 2026 10:07:28 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168bdc75sm19369574a34.8.2026.11.27.10.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:28 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
Date: Fri, 27 Nov 2026 13:07:26 -0500
Message-ID: <20261127-a733-dt-v6-04-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4c9ea902-24fd-4065-82b7-41d6df43b082@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-5@gmail.com> <1jik1ild9n.fsf@starbuckisacylon.baylibre.com> <4c9ea902-24fd-4065-82b7-41d6df43b082@arm.com>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Ah, indeed, good catch.

Thanks. v7 uses <&reg_bldo1> for vcc-pk-supply, with a note in the
patch.

On a different point: shall v7 rename osc32k-clk to clock-osc32k, as on
the A7S and A7Z? The schema still accepts the old name (deprecated), and
CHECK_DTBS is clean.

Also, is no-1-8-v on &mmc0 fine with you? It ties to Jernej's question
on 2/5 [1] and your reply [2].

[1] https://lore.kernel.org/r/p3YaXlLJTguQBGnWyMpb1w@gmail.com
[2]
https://lore.kernel.org/r/9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com

Enzo
