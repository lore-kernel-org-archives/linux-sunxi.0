Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEE613DDCB
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Mar 2024 22:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711491704; cv=none; b=aM8AcYNmlfSZXrleiZsuPj/yBWL1DvIzzDiZvdlDqtIlwqv02p0dIeR03vpYoqdQww37neJgdc5Y+In8jnBVUDcAvSqyoIBhFC1Ycj0e1tcRs49iTPW1twEs8p7UEFRcQsRtrkbtjV0BQ75aXo6XPLvU0+EarmTK1qjX8QyPHPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711491704; c=relaxed/simple;
	bh=mg5CHL67zV3tQUE3yPMMGIP9AiC9A0NRiTrNYg3lphU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jbvn9W9jzcctv8+gk4FjidGKMEENuwQ8UC800YzxmSZ3ZDbBDOvfxe4PBarusWMByr6gxQdCodFWX+2OLxDJ44KdEVJc9AIEqSc/Aa1IGlQVm7TFgOs+3cmTVGJgTd03l1RgoLUbwYuDynXZ/iQ9Cv03u01lf0F4pKtqGlRYyzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyqdbvUU; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyqdbvUU"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56c197d042fso2808435a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 26 Mar 2024 15:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711491700; x=1712096500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVLloZQohcM2K6KQJQyVlxzxH6NCVFHwUxv2R8Egdf4=;
        b=OyqdbvUUQAZ49xdGGIJ8A15cKqMDxNJgoqsNKcVW8ruT/b+BHNOEbB8YAfYji2IFUt
         BCfr6DCYcql9cBPQN2rHqx0LmzxYjjVW+nJmgSJug7wc/a6XVc23Klq3EwdW/y/3PzmG
         D1ZjvSU7dM+sDuPdDg9bP3v4pUZ4727nUSRtPvxOOfdJ32+hOfZyhtBGbdorSL+tt9Tc
         EoVvmLuGBwU4QoHzwb1Avdz0hW0yAjd7Gn0PltSgmGJHgKCSEmEj8LyqMcTE1bGS7BbD
         gaN5l5SP4dt/pco09A9ID0aI5mKvCw+oC9ai4+Qae/H5NxuK09eH+U6pqKTaL7luhVAh
         9tIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711491700; x=1712096500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVLloZQohcM2K6KQJQyVlxzxH6NCVFHwUxv2R8Egdf4=;
        b=gHVMWJHo5WGCvhA6xg4hVJJWNgITxOlS+K8LmZI+0cG6KG2u535iBXIcR+UI6mMYx8
         anFz0pHlm4sF8A8YZ3Qo3hVthyOcl5D508i2Kdrs4i9U1oHx4vUmmt0jUhwvSAIkaSjs
         6Q7WHkoj+Ep8x99xIY0/CJ5ukyYDCoT1m8s51t+4UuARtVekDkWDeNPkEYPke0kajjwC
         t1Dr8n82yUlEEwVm+4+2xZCO2dDwvTYO4Vj+S9i0OnHejVH6/t6vEvKHBtQM0Vq6ObcU
         +DLHtnQ0ou+K86wnKTc5R8Nd2790fCKQ26+gGZ2TdvExPBThWfY0gud+Ihn4JXgRfjQA
         X0Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWTGTomUlY8hyIPNF0hJC26rFxo4ZhBV+4NeYDo3WzEBrOVjEVmXvWyHAKaiL2oU8aqj+qy1kM+Hhc6cOkFNJBcdvQyMaVBOBrmuFQ=
X-Gm-Message-State: AOJu0Yxx1Vm3GJ31reTeBkLGe4XlI4Swcyg6wwkg1w3+h2oFo5xgn1X4
	hq8fNNkFssysMyJnmEC6nfWWwkDZCAZntQDFF66cwEpCsMxynuaO
X-Google-Smtp-Source: AGHT+IFbfOTWjdmcyMkuurrgXcsz3zLRqlN2HZmiCb9ThEJsejRWtXx04BXPLsIev7aMaw9frXjdaw==
X-Received: by 2002:a17:906:53c9:b0:a47:20e0:d618 with SMTP id p9-20020a17090653c900b00a4720e0d618mr763288ejo.60.1711491699853;
        Tue, 26 Mar 2024 15:21:39 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id y4-20020a1709060a8400b00a46bec6da9fsm4640433ejf.203.2024.03.26.15.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 15:21:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Corentin Labbe <clabbe@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 4/4] arm: dts: allwinner: drop underscore in node names
Date: Tue, 26 Mar 2024 23:21:38 +0100
Message-ID: <2317198.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20240317184130.157695-4-krzysztof.kozlowski@linaro.org>
References:
 <20240317184130.157695-1-krzysztof.kozlowski@linaro.org>
 <20240317184130.157695-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 17. marec 2024 ob 19:41:30 CET je Krzysztof Kozlowski napisal(a):
> Underscores should not be used in node names (dtc with W=2 warns about
> them), so replace them with hyphens.  Use also generic name for pwrseq
> node, because generic naming is favored by Devicetree spec.  All the
> clocks affected by this change use clock-output-names, so resulting
> clock name should not change.  Functional impact checked with comparing
> before/after DTBs with dtx_diff and fdtdump.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


