Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518180;
	b=2bOHl13J40CN14eoMxTf5RcoFvylUM19rKepG/vnfZL7NJmAB6chRDAxEqMjrWy/HRB1
	 Exja3c653tAyT5/wKlTMz9HlDlxQJaK4quRiyNkWRxiVebRo8n00aZJM34QNYkni0pMNs
	 O6+dAKWFJgTl3wEl1nskJqpaNGDhlV5CunP82TcBoGSaB4j3t4DD2y15agAUGSUwhqjsc
	 b2bcWo2hf62rJTmzTlDPZODBzHCx3BxesuvcCv3tUD7a7fF8+pfuWnvM7iwMZ3vQVFeIN
	 687CMxcmx+U5+5c25jqDmtSEGZ8JeddOGVv5NtNnXaJv8LbSReKKk3yUaNdjL2azK4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mkjJrkqN7PSqt35Slo7/CrqzZ7y1RXzaSbB1kKd5fBw=;
	b=49RemfEkkoMWxBas/QTXyK/tbCXt3xrAJi1y2VTtyxnMVdU7Uq3P7ZOEp6ds5kxZYSZg
	 6JIZVcgzwzrz8X6lX9QqBGhsTQxNbp1Eod7LkbmTCDEJR+aYJmcActqX/CSwlPPdhuZGO
	 rxZKqRnGM1miBOjp9tPLsZmCOPBODWU1dnhZsTrdWVsgJlj01pMq/oIhXzEGDKQGo/kg8
	 sTO7pz90/P1G8jnmG+yx/0i0LrjBg/4RXfOCse6HFPp1g3N+DfWApZr6q4CcebAwirtJV
	 laIE1sdOKl904b0p0jAgbEVu+Tb7BuCy7OfKR795QR7jr0/DwN/mcUww5gyz/vOazVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ex7aLHC/";
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1D0606A321
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 11:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A1D0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ex7aLHC/
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9905d61449cso1126425241.0
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 03:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795518178; x=1796122978; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mkjJrkqN7PSqt35Slo7/CrqzZ7y1RXzaSbB1kKd5fBw=;
        b=Ex7aLHC/Ova/io4Z2ySaF205v5wNlGPQ0uESl92ATdtDLYJiouTSqg+4YR3mnLf8Ft
         qBKloMIGdx+wGl8KbBy7AlMqG94N9zuUyCyLFJuvGQhfuJZ2WE2FZiGntvfOrZ3XSaEE
         WdZHrs+CnZlEskkV8YvwQJdtclvue7MhXFn5JiUr4xzCo4keIF5J4ciQXpMFmlz8ek7s
         UwOlw1DJ9J3qWWLMk9g130ETgkybpGkGLr3Lj9Gs84lVzbYDNrIAL6DDx0QFetDW+Vld
         tHXHDgNtRZLpDEb3dJbZvrKlXIGJIm83SVETz1mipAJ4V3yjzQt+0eSiCcldXheqwoXf
         HNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518178; x=1796122978;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkjJrkqN7PSqt35Slo7/CrqzZ7y1RXzaSbB1kKd5fBw=;
        b=y8DiMbXSEAx+5JMzakIG0sjVf7uAOKwvhOKX0fSpqQkpE6T2K5wBMBdEpfBgp/UUXF
         aVSsK1gh1h7lxgrdEVQf8lYOBIy4mgZqxgqhjA2KCQUG7/67Y3z0ndMrPnD5XJnzSiYg
         OgSYqw8UHCCZtpqXZFveEuVh8T/UVoXWzRs+ZioLVosyf2zY3eUekzm4tQPhIHAv1TWg
         7+dpZVNx/AyZBldGtsZJxv/ZOAD8XnHTQDWiSC9E2ongcolGUhTtEp3sVgzfvP5ICTtw
         LTTmeSjZPOHc/6IlO6OUEcncLYB24zFSxXbEqM/WhkVMYyR+o7MgB0RDlzkNg/KaiuMz
         BKMg==
X-Forwarded-Encrypted: i=1; AL+hErG2xAYyZG5RD1mgL6HSidjZtiqBENpfmTHigUCLaWon/RuYREvz33xHutDqkjuJaHorcLPKIaBnNlP4Ng==@lists.linux.dev
X-Gm-Message-State: APuU4Z9e83FqZI3Owe7JFPxTjU37pBJBCC/CavTvjxDznkUuYsDBGIy6
	dor8REkHJ7wJvL0pSj3EDzOrF0XDl9Kq2h8qn67Eq+AzAovDOAJubvD0
X-Gm-Gg: AZFdTZd++1w2Z2daJzUt6CLnmlk52MUJwmmTyD+B3xjGSqYsxJG8vr1Qn7nQHMmAgqp
	1fGRtPoZkO8ZfvlyK6jk4HUFURol46zjmH7bFN8MaivLrcAl6zG9gY9EmvBuuY8+qcJ8cJlXTtu
	KfCx1ShSkBaYlxBiIXswLQSzx8HeuM9jl2jCCxVn9IMRdcHUfURDpC2c2zG2g4xeuyKixmhnnwL
	pTE/J2ZTxr5UcEFurOYPkIz6MhxbXgrKuZnX4gPAS6tbXHvCfd3rxyKtnr6mPprsscP9q9oygGY
	h8sZxW1YZ6CPTl78j3mwRCmhJMBQ0lCbkum77QUX5JfPZqyDqF1vfJ1BTHPFF8TrRXuPfmMItMX
	vrConJDDR60oHuAUzKQktj47LuD0Ao1Vs/jNz9C9j6zZcPPtUI5ss//sjNVLXRODz358yxjrStJ
	Jb/GjlCoK7Qf1tSeHY5nyPnL7zahd6suDHpI9IP/YVCP/11IoQfrzdDzXw95KDz5/qu1634XyaZ
	zV4rGpNfqMbzFZ4d81Hn2Z7CWJ4LMrZwvxUk4Zq6TN4Ta439wARaQmH/ZKBdEYbolcmbCU38WPw
	h3PonW6k4IGnU3BxZZNP9MIOmQxlsKRfvTIy8oMGyN8BJBxB0AgBGQBbTmupwBET+R7lEIaWtgf
	KBNmQUvdKWOLtOla4SomtZuWViZitwLustDEzT9gSon/1Stcy
X-Received: by 2002:a05:6102:54a8:b0:7d6:56d3:f179 with SMTP id ada2fe7eead31-7d72b361a74mr6083753137.5.1795518177851;
        Tue, 24 Nov 2026 03:02:57 -0800 (PST)
Received: from localhost.localdomain ([2804:1b2:aa42:30d0:da53:c2d8:5b4f:38c1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e8265e55sm14978477137.11.2026.11.24.03.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:02:57 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Tue, 24 Nov 2026 08:02:31 -0300
Message-ID: <20261124110231.15528-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z V1.11

I tested this dtsi with my A7Z board DT on a v7.4-rc1 lab kernel with
some of the posted dependencies and a local pinctrl fix, not the full
list from the cover letter.

All eight CPUs came up, both A55 and A76 PMUs registered, the PPI
partitions were recognized and sysfs shows one cluster. MMC0 ran at
3.3 V and 50 MHz, and a read of its first partition matched the
reference SHA-256. Two card-detect hotplug cycles worked with
GPIO_PULL_UP and the local EINT-mux fix.

I haven't tested the new I2C0 PG8/PG9 pins, PMU counting, EL2
interrupts, ITS/MSI or the A7S board DTS.

Thanks,
Vinicius
