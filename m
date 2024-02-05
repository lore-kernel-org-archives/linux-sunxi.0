Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC87411CB1
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Feb 2024 08:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707122696; cv=none; b=mFV4crKZktNK/JYb0Re3GPwpO7U0wspADmnwho6aG4EbHlNI3AH0xLw683Y72vJUJrbVs++B4h20AZJSNFKxZTr7Pgnbb1VZ17rRmym4ZwMmBIq/hgi1SOhoBF0TExAzXnBXBseRhwOMK6iHIoRRuKLCSDUivqUdGFTGmubJIDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707122696; c=relaxed/simple;
	bh=1wMUt8pZVFoDqAIAQLZH2JL+iJaiah/cx+L9bkgJSrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QK+AbarBJ5k+PYO++loclg9vPzkmPe46KpzCs6d9zauydiK7Irdt1IebJSbYV+DEXDuMMbxBdwi3WEUO3qwaxaKXj83OljJMZqa1HH+2BT+oV1+Mpvhpz2fjKEDyCRcDxQcPLYUi1dzABqxVl+0eMZQns9EER21ggD2ozE20RrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=avnC0eK6; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="avnC0eK6"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so556423566b.0
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Feb 2024 00:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707122693; x=1707727493; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h+XVWW0j5+gKWdEIveX7s7HdS9Z7EGF6V+nCYKBlMsQ=;
        b=avnC0eK6SPeHCCAwb8sq1N4BM0dSsdWRmTlMnjGMAyguSAgPNfRvI3MDocTjKJgXR1
         LZ9cCyS2l9y6oICONoPZUSyjNB4VNNBPvr7IpH7fBO2ZtrFfhvEVha6Urm8KrfMmjx4d
         xh+NGifEA/PoETGkF9Ai2KPfQ+JjYOr+dKzPW5NOQOMUAcZPzLWrj+T1b282GpSz8VZi
         sRaXW412jcCPGeOj2gqciClTMTgArGxyn6bpSl0l7mEzTxIX+Z3Y1448UiZ2837DBihC
         NFTbfP27mGtr/YfF2mPSD1GMy8xmV7nxY3eyW6tqHQb0p+TOzAH2JMNFQ6UxdpClx8fi
         MOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707122693; x=1707727493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+XVWW0j5+gKWdEIveX7s7HdS9Z7EGF6V+nCYKBlMsQ=;
        b=jauRjYl30hmkDKzCZS5y5p4w6BhVZsd7IpAPjNpMjd9aBIQYAdIqM4k9zc5gBkwfKJ
         AjV61ttw9zgs2QPnOzECYVQbSO0e5fbycG/DGAHpwWg/M5jkMLYB0OfwiHA0/p6/p3nJ
         N5aeXehm/wkIorip1rwTPjLNHQXCdbeEBUUjYjWbOvXjzof1uybZwdnfpKEOboqTYIvN
         jwAtgL43w9nIVjI5PMX1a5ynmXl9cwGUluuHZpwub5Rnp6Siuc4USKYRnIYlxVLknTxI
         4KR1JaiZUKjur5VDlwKmoNzxc4PIDsTb0Pd7X5Q9YaGFxmg3luH1ILkgw31Qz480uzKq
         4Tfw==
X-Gm-Message-State: AOJu0Yyule2713WSvJcHmndeQER4lrkXzEcaRHuyA8eVw46sbEI2jJzs
	o7U/k+MbXc4/YPuYbKjGAlQk7rFxZnD4UnJWVxGS5PvTYJqnZM6bBjzXPAIf8jI=
X-Google-Smtp-Source: AGHT+IEg6vtzHl9ATtgeuoFkhydYWNB8dqw2Y78dP5IOXTvjYqSZV9ddYMkuUge+V5ItiaicfW8JMQ==
X-Received: by 2002:a17:906:5395:b0:a37:bd9c:ad74 with SMTP id g21-20020a170906539500b00a37bd9cad74mr1036717ejo.75.1707122692730;
        Mon, 05 Feb 2024 00:44:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUuE8giXilP50pBSj/BfJCSa7aw1HJRQmXeIZtsA/bdpJYhvnnlp3cFFCDVjy7ltoMWdM2b6W1UUUdCUzYap0Y/9G2sBj5JC025PAocaO4VzlRIyp9KTclBAUHTKohRaG3rgrH95b932fRfkXFWrMw+mS3OUl40lVH0sZJdRcrmUajztd9VZsPy+f+CWARTcufhXbPrXzpzz7QiUIVBObWebR0PoWEsvdPVABYS3dkNc9AizuEd5vDiihm8+/TFCsSIa8jd6tIa+2/GYMGybuk32yheReq6PSwphWnQQ4HD37EdR8JTAwH9+0KP8dIl6+KQgZ9tCd8CaG9ymNTAiaS0d0te6IWXmBVpLXUeK9nxWEh9
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id vg11-20020a170907d30b00b00a37669280d1sm2350990ejc.141.2024.02.05.00.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 00:44:51 -0800 (PST)
Message-ID: <be380e8b-b5b9-45f7-ac8b-699cb3a37c4c@linaro.org>
Date: Mon, 5 Feb 2024 09:44:49 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add Jide
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Alilovic <nickalilovic@gmail.com>
References: <20240204094404.149776-1-andre.przywara@arm.com>
 <20240204094404.149776-2-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240204094404.149776-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/02/2024 10:44, Andre Przywara wrote:
> Jide tech once create the Remix OS Android system, and shipped it on
> some custom hardware. Add their name to the bindings.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

