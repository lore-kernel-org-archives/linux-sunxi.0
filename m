Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3092C1A5
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713088456; cv=none; b=Odx9qXk9iK4yn2YOmYIedzTJvNBawwwQf+ssOOwFJxrnUBjULVS7ONGqGcavAf4mKFHolm5E6Z+2iDxr3JFsrsam6oeUzvpd6WAY37m0CJ37YFu6FTYVabG4egSRP2wzwSdldohzJ3Qg8jh6z5jedDhn/SY+rskFL97EnnvfnZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713088456; c=relaxed/simple;
	bh=wgynEANorF351RVzuOsloaArd9XmEDXEW45pR6cxVTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nen1TMa1rq3CDmQD33Pcq0egG/b/8aGSAhrd0vNg8IJh2+vzcbfwEGnnDdpd62XGG2CeX/4KiwLufAoDpv2gAAKf6UIwT3Xq2PPs05Ut4kSCrbmjsJflmYbrg0ArrQIJwW2glKIuhbNVRftQNZ0wCCUMDLv8Tru4i48IQ223nko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2M5KDTe; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2M5KDTe"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-343b7c015a8so1751535f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713088453; x=1713693253; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=966TSiAvoCvjdkEs42Fq1pDpYys8o1+8WOVsY0jF/Mk=;
        b=T2M5KDTe3i8A+uYBQ8YXOLcOc1LoRIHCatf4O8Ekab0/PNZHorgjxAzkJN3ZL5rGn0
         0Y+EzUa2FMwBEStZY/JICDEFR87OKxL59Cc92SBoY6feCELZq6t1vofQ3hxvf565tUft
         CpqA7epxzZzqhOA7SkeYAV0kYNlY7gRBmYyBQZ4uSi82tv5JBdrZrqqGYYwPI65hq2dw
         g2TxCNKWfMoN9IPsIfslRwMHwlaxeB3vaXEtUHJIwm6SRvupfKMgY+iBmLdXRipaGkkz
         B1/t6fCkt24yWR5r8lzX0bsM0f1DbeLb69C8TpjIXRL5YxYaz4eRV+EYwcWpJ8d1lA8V
         GsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713088453; x=1713693253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=966TSiAvoCvjdkEs42Fq1pDpYys8o1+8WOVsY0jF/Mk=;
        b=SyKCBsRs+KwQupIgEA0dDivW2ea2eCMHbvaBw3iHx2zjMKfR+DDYEsgiEAKW5uc1MJ
         MtjLwyOqZyXL6/fuQ1QjmXvZnhETQyKoLXDcHs+HfzD+Qj9iFqk7RiqSkvltZbovPWUX
         nOaEfwL8ujMxJoxftLorbJabM1UCi+/dIFNg7Kb0UoM6W3O2SbrOENXHi6+0WlXhTLX/
         i+dOK5nO8gDuCIoBnSGquTsIOWw1hqOfDHvKNFp6svTOyVslrkRI+RZZnLaAKrvRuCpb
         fGgxBEdU5RqShclrL7j9Bm661DDiGaCNKVUHkrLyFBLdlUL2doAoshtAVwfGOt92sZ3r
         oheg==
X-Forwarded-Encrypted: i=1; AJvYcCWxBdawu/RelnZLaKQBW7bvHqkahvd7IQRBtunF6q7AFskIWrcHGGodXrsODUAsWYJm/NXhn7paydca1QWNl+2DFBXtMXM8Z5SiRuA=
X-Gm-Message-State: AOJu0Yxy+qb1fLLHLjXTAOnTD6grd6CyBdIZ+bvLcPDWUnEEAfCyVxzE
	QpQ8tubTntJDB+1mczV9a+5y67TQNLLenxluZZvChstOBHOZKd/V
X-Google-Smtp-Source: AGHT+IF2QILXTcSU2QsKiUfeu3z+cURRk+Q2HhcPstTor91J1lND/K2er1pKaB2wW3r4LHfskQ1xxg==
X-Received: by 2002:a05:6000:109:b0:341:e10a:4858 with SMTP id o9-20020a056000010900b00341e10a4858mr3723437wrx.56.1713088453477;
        Sun, 14 Apr 2024 02:54:13 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-123-252-50-gprs.simobil.net. [46.123.252.50])
        by smtp.gmail.com with ESMTPSA id h5-20020a5d4305000000b0033e91509224sm8690824wrq.22.2024.04.14.02.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 02:54:13 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: fix module autoloading
Date: Sun, 14 Apr 2024 11:54:11 +0200
Message-ID: <2929619.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20240410155420.224157-1-krzk@kernel.org>
References: <20240410155420.224157-1-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne sreda, 10. april 2024 ob 17:54:20 CEST je Krzysztof Kozlowski napisal(a):
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.  Clocks are considered core
> components, so usually they are built-in, however these can be built and
> used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


