Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A356114533E
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 04:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713933723; cv=none; b=aFCWWFy7M++oD/Ti/F70GPTbXbWAK298fI6gai1a5StEuiiqzC101KrTS83Cr0JA4KSRKIMFtmMPdFvPqBpFvyWfp2n1CJrLTyZQz5OXbROsjVGnisP6AdKjBfVTf8xcUceEAOGzL6YjmTEfToS32mhoy9/fNgzGdj22IPZub7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713933723; c=relaxed/simple;
	bh=JM2B4kYxrGaJc2NKMceh1oRnw+RaynWIsgZzr48AKAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1jmPcXmVYizkw7VLZN3bL8z2qT0J57NWMEWR/8VTwlf7PNHDJJOwyRHxLjL003WPj56vqFZrwSykIBVuCHuzqnTjgR8sY+wzWhGt4A32ePo+gyzh/GQW6yVXQgEwLBht9rjdN8v8WenK/36fUVPDaW4jI6w/WohGmuJlfeT34k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e1OT888T; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e1OT888T"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56e78970853so915846a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 21:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713933719; x=1714538519; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T612ryKrlD1lLpjfSdxqiGKjKbEdGbmwSDBv0V/5m2o=;
        b=e1OT888TYWUQicKCq51ezmu9FFsHqXwfCeu3fDOOV0j4VpUjK7tovGzjdV1pTyw9oD
         uwKYg5EFFt35zRQhzIe6HK5Gm9d28EMMwqZo7CgMAEKNdqq0EtI6YA5j+wpOB2b7Me1m
         EqpHWc7air6NKxTLxnZJgxLVABaE8Sfzd1P/2two/NXBF5dfrB//KwXinMO9C7mfnLk0
         ODCxDRD70fYIOiYUoWS8aGZwrGZ4brQ1BrFr34EAYKLgBuvrJzvZMWlC/i6u8/8JT4pK
         2UHrk5uaxDuBGNOlV9k+Ry19uFM2Y0I3fVflnkHbCdZR59SIgC51l65lzHF92kXVe4jt
         htqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713933719; x=1714538519;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T612ryKrlD1lLpjfSdxqiGKjKbEdGbmwSDBv0V/5m2o=;
        b=erMB1IH2WKbsEaKkH4u2IWA8hQO4YbGK26VLkv7b8JoRkSsnXMJoOVI53woYB/3s8o
         A7yzyhXhPnMaOeItMbYBbhX75aKGvlCoEBU7FWafXJ632p1RAyzHIVz0tv3G9tyf3T7w
         J4Q2xW2EEjoOK8t0h1GKoM9ZQExoUgHSJfmASwfkMSdhSHCx9n/4AtWLXML52mhk1knZ
         qwL15CsSbcjg3GA34w0Vgltv06teb7oSZrC59ptgvN3EDCGVvAuV9ZfuEGEtrzIj/qGW
         mdABMMR4OzwxBaZ0RFL0w/2UjEWcXR1tqe3dQV7qJc61kgqnkiMpBj46IBae3sddXAnq
         S/VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk3a7glcvD2lAdlQRY/PW/dTAlwf1wezXVJsC4WcuTsXRSPPDEZUm4Z+WUk5FDI6imZPlI3oF4PSclDZwHn0+q4ezOAJ1AKErFymE=
X-Gm-Message-State: AOJu0YyPBDOJ6rh64mykaD38IgQvulHsifmc1Xe73JM4x6Y4t9kbifVD
	BaPGyKxD4/Zx1wBpAyN8PMCpBcu76TPDG6xdEfk5gWssP7Lu4Zouxs77B9dpClI=
X-Google-Smtp-Source: AGHT+IEWv2JsYX9rqRAcHeowDL82ULxOjn8wnAPDfjrZp9nCUz2OxSDSf4uSTZAXJ6WLLd6R3+ndew==
X-Received: by 2002:a05:6402:c05:b0:570:1fc5:72f6 with SMTP id co5-20020a0564020c0500b005701fc572f6mr4650224edb.0.1713933718812;
        Tue, 23 Apr 2024 21:41:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id g1-20020aa7c841000000b0056e718795f8sm7351315edt.36.2024.04.23.21.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 21:41:58 -0700 (PDT)
Message-ID: <1d2412d5-a05d-4d1e-8d50-53a068b90931@linaro.org>
Date: Wed, 24 Apr 2024 06:41:56 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm: dts: allwinner: drop underscore in node names
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Corentin Labbe <clabbe@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240317184130.157695-1-krzysztof.kozlowski@linaro.org>
 <20240317184130.157695-4-krzysztof.kozlowski@linaro.org>
 <CAL_JsqJfT-jui5P56CO4Fr37kr5iNN8dpxt8ecKeFmdVGnRYbA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAL_JsqJfT-jui5P56CO4Fr37kr5iNN8dpxt8ecKeFmdVGnRYbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/04/2024 23:23, Rob Herring wrote:
> On Sun, Mar 17, 2024 at 1:41 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Underscores should not be used in node names (dtc with W=2 warns about
>> them), so replace them with hyphens.  Use also generic name for pwrseq
>> node, because generic naming is favored by Devicetree spec.  All the
>> clocks affected by this change use clock-output-names, so resulting
>> clock name should not change.  Functional impact checked with comparing
>> before/after DTBs with dtx_diff and fdtdump.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> This adds warnings:
> 
> 13  prcm@1f01400: 'ahb0-clk', 'apb0-clk', 'apb0-gates-clk',
> 'apb0-rst', 'ar100-clk', 'ir-clk' do not match any of the regexes:
> '^.*_(clk|rst)$', 'pinctrl-[0-9]+'
> 
> Since we documented it with underscores, I'd say just leave these at
> least until if/when we define some standard names. I'd prefer we spend
> time reducing warnings from the common schema. I'm looking at
> root-node.yaml. simple-bus.yaml generates a lot too.

Uh, this was already picked up. I will send patch for schema, thanks for
the report.

Best regards,
Krzysztof

