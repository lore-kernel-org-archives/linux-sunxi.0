Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2105255
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 20:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706043438; cv=none; b=Hjf7SSx+4Wz93uImaKtYlVKUEcSx2miDV6xHdSOsmAyK+/SDrOUzL1sPA99z4LwIiYNF4gRdH29rS1KlfroLYqkz74qlxugO7rnHOMX6DgM295/24pRvnE1I/OA19HhIRuLnWPgB5OFNnfjyY4vgD8b+Ffv1n3AOV7xop7jx/IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706043438; c=relaxed/simple;
	bh=Qk3x8dqsv1qQiDdx/sUfNPuTrucAaY1crd6XyC3bwAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQ/0n1Bz5+keCyaGmyW393pM7PIS1F5oXjXwJvIvMwoy94IUHQEg2n8Z0OwDXO8diQqQssJiDk9IhabnvkQevVOVKs8NuzxT1FSkRctBQ2E24Z+XHV8AoI269RT8OGDENa9Xb9FcKlEIZLiJOgTQdSt1jiLPQoQPlIBLwHpws5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGpQjdeq; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGpQjdeq"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33929364bdaso3101934f8f.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 12:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706043435; x=1706648235; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/zvyCf7Yo4bMfKCjWxvWf8T9kOG2qLOCH9hQfg6UWw=;
        b=GGpQjdeq1rGJ7z2w7aZ/NOxuBvaCF/1Y62V4z8EZGNni1eZxLBRy/D1ByUsT6bakTQ
         hhBaxkkRSmmEUTwO5WuW3XOCbLCJtiGOuX4kFpnr++vDdWyH1YFGDhsMdwJLg8doASQD
         DeVp6d0ldckLXnQg1sTzvmO4+5DyRDIfdg0/XfVQ0b2TTc8TNIohgsYCWSUlUqRoEZGS
         3Fw6aIkt5z6vr8cRMkaUaeSkOY335aIIRTtaU+kwPCcVCkybApMWQcTVkXXXJwuSS+UK
         W4vu+/EETSnDPnf+jQnOPFnq6zo9egUQF8rr8sPXhSYK9eJCmYXXHGFn3Lmka9IjpPI3
         jC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706043435; x=1706648235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/zvyCf7Yo4bMfKCjWxvWf8T9kOG2qLOCH9hQfg6UWw=;
        b=wJGhNxs+n+A2x4jyiVwwHth/Ey4NVLFohjyNYiKi0wA5jdd7PQQs444z/T/RXpXqPd
         9gwJc1bnNYEe2yfE8HMyrx/r2de9wITCYqNYr14S5v9blNvsmEXsC1h+jtqH8/h6tV9W
         zgoHA0IgRj7DqPiZgaYLoR5suxCjzQi05jgnoZoIln4YQDYeoLAZz7WBixNKHXcXb9QX
         ZezDPovoYYMARIvmxxcWvWMtA1vRnfhWT4kUPKEAu14ApfIGSBERhesXWxgOop2ioeWk
         Q/V82zHlI2MTJpCU37LlpzM/OJwh34PKt31HhvB3vzPKeGT/Wde++F0lff8qiotOCOxH
         LeOw==
X-Gm-Message-State: AOJu0YxSqrLQ7YqfcRJ7qUSipfkotnW6uDjjrrHNSojM/eOLO1d1X7xF
	/PXyyWWMTdIDMPLfZLvT0cqxDgcZL1YKDqctmI96C/MAXfjZQfvM
X-Google-Smtp-Source: AGHT+IEGWVDOmhMh2CcmH98qX/zmGj+R8TRFm5n1pzOFRnjzDpwsw4e2BFNlV0MLjxy1vjY03h6c9w==
X-Received: by 2002:a5d:5f53:0:b0:337:c288:2595 with SMTP id cm19-20020a5d5f53000000b00337c2882595mr4433474wrb.78.1706043434520;
        Tue, 23 Jan 2024 12:57:14 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id d21-20020adfa355000000b003392a486758sm9520919wrb.99.2024.01.23.12.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 12:57:14 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH] dt-bindings: sram: narrow regex for unit address to hex numbers
Date: Tue, 23 Jan 2024 21:57:12 +0100
Message-ID: <9225339.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20240123083450.20996-1-krzysztof.kozlowski@linaro.org>
References: <20240123083450.20996-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 23. januar 2024 ob 09:34:50 CET je Krzysztof Kozlowski napisal(a):
> Regular expression used to match the unit address part should not allow
> non-hex numbers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Merged, thanks!

Best regards,
Jernej



