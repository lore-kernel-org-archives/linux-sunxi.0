Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60DD39EF3F
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 09:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329408; cv=none; b=ICyS8EQK29datsa7OfjaxY07RIyk4Ksb18vOW2p0Z/R40hSgWzzXRu+X69YkNP02lz8u9nN/N4QwYSSyGfBsPyG7Ud1BsKYwpGAQLFGHBi85D9Yu9dz2OwEr0362AdxaaSz8s0s+Uqb0InbIR7/GWhMceQDAsXBVdUKFfwrjdlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329408; c=relaxed/simple;
	bh=n9nR8Fg+JMZq1BaP4ahqBVtAOKem/sDG6ZYm02uG/jY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EdSH58AMuEnygdJbfsS0NqTGg315GuiCOZFxPcKiKuZ408nYXMHMPZwU+CT3HgjLJpr1zJo1uksS1VYKOS4RgFP23Mh2XfVXfmx74KOeem4yuTp80D6Oy4jno/YHxdKGLlNuTo5V39NuoysgUyWM3a07ebbHa7R0bWfth1fRInw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Au7QUCcG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Au7QUCcG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so13737685e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 02:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783329400; x=1783934200; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQyAj/mTcNP80GWpdq+ZAxNRRGcOVsB8iHT6S7Y5T98=;
        b=Au7QUCcGbbXw8f/qJAgVGX7QzHfAr9Q8HqtsMQeAS89qkFRRfgMJFu9cyLxW4zQkv/
         JNnO+3YxMMRY+t4q+3IL3Pl66E5soAyTrjYc8a72dPv3loZSIxHFz21Q+tU9LtMX5RQ+
         pdm80l/doRkObRYMSY6rcoXSznWav5/ArgGvl14+dbdvEDV3aiKU68K3vb9MftXJiPaW
         d3nQFXefUcyET/kj6Zzk2yxhkFqO40ePsLdR8u+COErOyih/bmC7HBQ/viwZC50AWEA2
         AohbDUB9mRBvaMJxvcZ3Rjsmk1I+cAOzYyJFESt+RNbmLGw6Y6alvioA1dv+OkbEPFTj
         d6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329400; x=1783934200;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FQyAj/mTcNP80GWpdq+ZAxNRRGcOVsB8iHT6S7Y5T98=;
        b=baOAMyoP9HhBM4/StebAK1t323eYXl4v+h2m+szYvs//ZTJxDBm6JQU2VJn7kvvjw+
         P1FnTqulfS0RjstZgMGK9uNNS06OTKEQLy1Qfc2/FAhwK6yFH3X4I4deEOPM35wB9RlA
         BbqmgsDAqvUtyM47dPX56k1Tcn5wg+DVug45Kvt57AMrioHt0CRz06xvL8nnLV0icWLF
         Bs9OOxZuvVxRFmSvyzlrb8qlUfFhqR9YRW4Z45qoLlK7MM0WxtkkgYtajH1nFasT3Z8o
         R0gRso9RFSMvP/IpTW5FjhQ0AXWfo0iiGq5RRzITZ0Jx4VrqTH9gIo6+taxReM6Vspp1
         9j1A==
X-Forwarded-Encrypted: i=1; AHgh+Rp2ndfdmPOW52dgYDK2/K667SovA3csi/DMhUVRy+aCEqXvoIN6qsmO6eNV0CSCKmLeONxZ6lbDfyXu7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YylhR36okH2+tgyLQNusikdY03abPDSxOm8myeXH8xlZs2h/oMl
	OsBAkUPch7GKC78tJTB+6Gx+EyE+3h61YYpgn7uHxJm0Y8llP3V6LJI+Ytvc2cS8qLU=
X-Gm-Gg: AfdE7ckoYQVwGzFLlr1TF2OPQXxIcK/rtFSJvFUt9juTT6VKqsB7D+LJMdAclXF5VMS
	C7NQrEG8CZkIKomiqpZR7iRTVek6kKFpfJz24R2smAj0sV31ZmEp0Btu0lTRsMM5CvpepInt6jf
	qk3bfhD5lObX6TgzF7w7hKDNVAWgSgsMWcEqYMne4R8EP8suiqkTofaByUUXp8MZE/mjRa48yd2
	djSDDFZvOsPwN56aWB8PQN48BBEEW3fF/t9L0Su7uSx0B8UqKKvI63e74PndOnmOWTBQVWq7VgQ
	X5O1uhX9/Blps+nJBGax251VccofWjk/fVD3R5ydg5aid8KujN5M5rifi72r6GfUgVftEs6AkYf
	nFgKo6LnE8N0rLU7mbG+gDP2fQJwmvV8p7v7tU5rDUunF97/2kKuSI9UaEPiz3XHCzQc01h92oY
	9XKh2SbKlaSnw=
X-Received: by 2002:a05:600c:3551:b0:493:c453:6002 with SMTP id 5b1f17b1804b1-493d11fb8a4mr101976925e9.35.1783329399663;
        Mon, 06 Jul 2026 02:16:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c6381e4fsm412373525e9.8.2026.07.06.02.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:16:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Maxime
 Ripard <mripard@kernel.org>,  linux-rtc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 6/8] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <CAGb2v64C4Xn=V5NQcqZQa=v0KsemsVh+_6g7ed0kHz6C_bzmww@mail.gmail.com>
	(Chen-Yu Tsai's message of "Sat, 4 Jul 2026 16:25:07 +0800")
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
	<20260702-a733-rtc-v3-6-eb2580374de6@baylibre.com>
	<CAGb2v64C4Xn=V5NQcqZQa=v0KsemsVh+_6g7ed0kHz6C_bzmww@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 06 Jul 2026 11:16:37 +0200
Message-ID: <1j1pdgiikq.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On sam. 04 juil. 2026 at 16:25, Chen-Yu Tsai <wens@kernel.org> wrote:

>>
>>  extern const struct clk_ops ccu_div_ops;
>> +extern const struct clk_ops ccu_rodiv_ops;
>>
>>  #endif /* _CCU_DIV_H_ */
>> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
>> index 766f27cff748..e2d6833a6d33 100644
>> --- a/drivers/clk/sunxi-ng/ccu_mux.c
>> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
>> @@ -68,13 +68,14 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
>>  }
>>  EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
>>
>> -static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>> +unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>>                                             struct ccu_mux_internal *cm,
>>                                             int parent_index,
>>                                             unsigned long parent_rate)
>>  {
>>         return parent_rate * ccu_mux_get_prediv(common, cm, parent_index);
>>  }
>> +EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_unapply_prediv, "SUNXI_CCU");
>
> This does not need to be exported since all the base clocks build into
> one module. And maybe it shouldn't as we probably don't want individual
> clock drivers implementing ops.

Indeed, I'll add a patch to remove the export of
ccu_mux_helper_apply_prediv() as well, for consistency. It does not
appear to used out of that module either.

>
>
> Otherwise,
>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>

-- 
Jerome
