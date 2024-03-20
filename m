Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637681DA3A
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Mar 2024 07:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710921127; cv=none; b=AJRZzarLc0a+8Yg8P93qSNt2kBzbex+j2QtRyhqelQWJlIBHKIEnxC6r5vqOeKe2dDhxbdyC+UTuVSURcQTfMxcBD71ajxvaggeo3oBjmDuwZfh4Mc5hJ28rAICP5IiQcLQVlH5Wea8UeP3ANXo8g2qXeddkpimH3jE7hxAO3Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710921127; c=relaxed/simple;
	bh=iRLYWjDJYo9C/Vb6ZgBR4j8UJKuqw6+eimV/6sXHQvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mj1zlZWkUa4HVQMHfD35u6d4W7BZ+m50RPS3reSKcGB9tdCJdb6996UURudanDaTixOgkLOy33TYRXSibGFNcePSRK8eYvjdHd8vkNmVo94+3lq/uwJcNczpTTK1ImPSd9+eRGhmPz6ts9dSlxB4lLpy5JQWHDvik2BT/4TSlbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pwRJuOFh; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pwRJuOFh"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a46cca2a979so160948566b.3
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Mar 2024 00:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710921124; x=1711525924; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MdFXtzLEhiNt5dy1jWNOqEJC4LRD6aFXbB2ka+clk6Y=;
        b=pwRJuOFhqYN+JqgYBW69mMi3VU2skQ92A3MvhsKH5xrVCDWH8OQw4ed4LlbnrnDVFG
         GhRqMOoWxWaRz0tfrhlkkh+Fvf7Y/Qhza382558z+6WVqKONv330M9hIZQuhE+UeoCNn
         ftG2xlfpm2W4Z/NBS1zsBckWu35p0LOudMpAuao0nGp0DoRjH6Mtd/SRLLzQS3Iu0MSi
         Zzxsk83k1Dbh6wWURtDmYazCUNfHzGNbve0uXjKhRqrZ2xi5fAr5/zjkPURxEVdqgbuC
         pS8gvukz4FUpiKiZm0JENmoxOIUeuRYE4xH5u4YbB86u5I8f88cZxDFTgbMrbt53t+Nq
         1+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710921124; x=1711525924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdFXtzLEhiNt5dy1jWNOqEJC4LRD6aFXbB2ka+clk6Y=;
        b=cv6uyD5N6txfiSQ2FnUGUyIXs5HBddQwOaHaf0U+QpgQmOkAxmlaKOSrKe31oB+vOp
         YkZeYMqZ3fOjy9FU3tghoorGUf+8Sg0XYesE/7cxEV9GZdaSGqKib9COMQ89oabZRSQm
         YFjG4MMjwNvtRQjAGMazGa+lisCriQM0Eqx24RMejMEp01W10QYZRH3123EgTuwR45SO
         mvfLVIMDtghb+QVCPdkZHd8A+/wQdvCtDQrXgQfRV5MYoCwGwxS3ccJhN7q/Injf/1lL
         Qp5qooS/KUzskay/HUFG5GkbONLJKjB8gCI/cYfAuYv9siVRbHq8Q28k8pwOuNen/TfE
         hOSA==
X-Forwarded-Encrypted: i=1; AJvYcCWWKn0fX9SivsMhdw9VmDOAcvYxQmCC7BB9UDIWEZAXfBj3W6oeRbWGLD1K1P5XfUB5BDky+Dwpj5ukch3uHcAcCgJny0+LluRHbUc=
X-Gm-Message-State: AOJu0YysJW9j97nxo7CsiNBPIqnUAr8lyrv2j67QiNKZ/CE3R3UjuCXB
	bcA9EgsMNBv53z2uGbAAPLFQuTKS7JUyx/n/hcvrWVTIVfpMhBlImueRddrnPGA=
X-Google-Smtp-Source: AGHT+IHDQv53H+E8HlX8eV68Sql8wMvhNWuGf3oGuQVmWowN3EZUORKgVFSGI53CNkE+AUrUVODv1A==
X-Received: by 2002:a05:6402:388f:b0:568:2149:329a with SMTP id fd15-20020a056402388f00b005682149329amr9345451edb.19.1710921123740;
        Wed, 20 Mar 2024 00:52:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id bk10-20020a170907360a00b00a46e2f89a9csm1467164ejc.32.2024.03.20.00.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 00:52:03 -0700 (PDT)
Message-ID: <1fe9e119-e293-4875-b633-0ce4bd551ee9@linaro.org>
Date: Wed, 20 Mar 2024 08:52:01 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: sunxi: Add Banana Pi P2 Zero
 v1.1
To: =?UTF-8?Q?Pavel_L=C3=B6bl?= <pavel@loebl.cz>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240320001152.4077150-1-pavel@loebl.cz>
 <20240320061027.4078852-2-pavel@loebl.cz>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240320061027.4078852-2-pavel@loebl.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/03/2024 07:10, Pavel Löbl wrote:
> Document binding for Banana Pi P2 Zero v1.1.
> 
> Signed-off-by: Pavel Löbl <pavel@loebl.cz>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

