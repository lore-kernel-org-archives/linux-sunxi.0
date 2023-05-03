Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC836A45
	for <linux-sunxi@lists.linux.dev>; Wed,  3 May 2023 06:12:18 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso1258545a12.2
        for <linux-sunxi@lists.linux.dev>; Tue, 02 May 2023 23:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683094337; x=1685686337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mgYCgNS0MQTBVFvuRN+B4YWv6Xql+dVFmfm2BcHVLME=;
        b=WoJnzQXZlpBLu62zpB5udi4YjTXhEpM7+vKIIA08G0xOd1TbLEnW5cTdsDj8ZxJWX9
         a+CA4Z/S/3CfyfPVJ/XfuuSq5d6SXFYNB0CXLnlxv5nk2LKEPObXkLjLqv0u522+VEvE
         Xx4h3DEDS9dBXFQvDDpPVPbIYVXlucpI5XfZSTOO/S+wwCkTeZ5iM5UIY3bF55te9RLs
         ZuWfheLiaKrWO26qbGUr/QsWmaVXcvOhzaENU9aMVatYNGv3LBmgaBu3neLs9/pKLt1X
         UPPrcLCD79/Z9Ou6RNASjngZN++LxGF1rSVuOGOg/qXtd86JjEmAjQRqAsF6mbILkiF+
         ADHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683094337; x=1685686337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgYCgNS0MQTBVFvuRN+B4YWv6Xql+dVFmfm2BcHVLME=;
        b=KKqx9ab20st1TH6kPCRkckjPvf2tYdX+yKGkKywZxrtUsd3aJJFPqDx8xpGygYzazz
         EBI/F0IeAhbuR8ZzgvrbDGIin/6peDrK04+0CCzDStzgLXxsdmTc1ooRUYX3S3aE0Jqc
         Msu4Fewh4m4ycbZhUvk86Uu1pL2j5KIJ4hpOHIAuEbJ0lVMA02e07gRqhKxAjWizZhFl
         bZ1v9jlw8d/e0x7P8qdNGYcWowbmS33nWYhpOL+Fnkpbs8/qyVdeCj5n6r3KijVS7sA2
         fQSWm62m+r4eMgW9I2auAM3maO635FvVqZlZmcaZUFMODc4QsjfW0DLcOoiFjAQG52ta
         sgCg==
X-Gm-Message-State: AC+VfDyacfkgP1NqA7W1j2tXkKp7wY8UnzkAmO7oezfB/EvAgiJpECpl
	bkbKDLQ534+0p+Zom6JBTu6orQ==
X-Google-Smtp-Source: ACHHUZ7v4/iP8CNJrGq8xzN6FhOMhNcteagGyrZyzuU7xkujmV1Jy93L7XlxV5hg7kBti1YRZ07usg==
X-Received: by 2002:a50:ee8c:0:b0:4fb:953d:c3d0 with SMTP id f12-20020a50ee8c000000b004fb953dc3d0mr9847667edr.20.1683094336843;
        Tue, 02 May 2023 23:12:16 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a40b:9d8:1fa0:ecc5? ([2a02:810d:15c0:828:a40b:9d8:1fa0:ecc5])
        by smtp.gmail.com with ESMTPSA id r16-20020aa7da10000000b0050bc911eabfsm337186eds.19.2023.05.02.23.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 23:12:16 -0700 (PDT)
Message-ID: <c0a392a2-c63f-b51e-fe84-cb7061cc9b65@linaro.org>
Date: Wed, 3 May 2023 08:11:57 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 0/2] arm: dts: sunxi: Add ICnova A20 ADB4006 board
 support
To: Ludwig Kormann <ludwig.kormann@in-circuit.de>, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, andre.przywara@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230420102409.1394618-1-ludwig.kormann@in-circuit.de>
 <10a2e893-18b6-d9c2-1db7-3d500cc0891c@in-circuit.de>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <10a2e893-18b6-d9c2-1db7-3d500cc0891c@in-circuit.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/05/2023 10:06, Ludwig Kormann wrote:
> Hello,
> 
> thanks for the reviews so far!
> 
> Is there anything I can do / need to do for my patch series for it to 
> get merged before -rc1?

It's merge window now, so no, it cannot get merged before rc1.

Best regards,
Krzysztof

