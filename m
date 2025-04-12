Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A750F1494C2
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Apr 2025 03:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744429840; cv=none; b=izIddij1UsqYUo8QWe/1Sn+vTD3gnxF8KUOf8zT33MnW4bgF3eJxziRZzEMgHH4KVAJM2nRWPYnwOsDFHYxy3H4HsUXGFgxuO3xHNDVQu8UMwg7FOOx0WE8qTykQhKrthWFTLz2eEJ1ou6BiSdrUZGr82HWDKIokZPkKMQ2i5Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744429840; c=relaxed/simple;
	bh=LxzxpLuFqzA20rKYrlVYVZ1GYPBQpHk0m8ab776NZFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxkXR4JWPQ+yPkv+bmq0vEVbZQx+doy91EOZEcJ9dw6E/Gx71zoQ+sxTqvcnG9N/2dQXAxD90n+24wiQGXTYZ/CVhiZZqh2WIPmAL3kXkvjBY7R6jWPIeIDoVdXnKcO/LaoDSO+i1F+6z/1HKPaBNdsABgd/A3esTdJigEDoWPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5axEFba; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5axEFba"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so1970662b3a.2
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 20:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744429838; x=1745034638; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uxgICOMpj0NVx3WYcPGVSamgvQ2YeH2wLMAPVBj+n7M=;
        b=N5axEFbahRPKRjLrPUoV2jLr8uRSqdxHJ4WXOz4CHT5mBDQeRq06lKr/uNjK0VUHVc
         m0b2b3KPN6szA4yGsnoCJMis7gnCCTdo9+gwuTeXU1jcFX9nLKnbaJ+Svo0isn7K2901
         PCxgcK9BN9P+aKgR3pasvsU1dCFTGoaSis6yua+aIXrYzhw7yxYRIY5A4tjKvwXuBndM
         2W6xGXr+0ghi/GGUQv5t9ld0bForm3d9IGjG/BnrOFTmzVMEB5e1ON0pgan8noSzGbZa
         rOVGz8L9GBNzRBndM7tpfTwlkiEzF77mX4XJZR6Kijbh0JuV5Io43w/BtFQDAe6jpLYK
         XDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744429838; x=1745034638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxgICOMpj0NVx3WYcPGVSamgvQ2YeH2wLMAPVBj+n7M=;
        b=bqVxlxGKsdJpTomLmBsu4zc5HnDp+DUA6zdaOtom0xB3nMO+eQAUKc2Ub7cjUu6QMO
         s6m+1eqeKtbqH+f4Pv7/dLF8nl4YFmrW2Sucy/+dB/5pTq1KEwW4u4eF4meEV/wrqs03
         k6CVuvXKrfnMuclVpmllKtBdyQuAXSF0DuujnR2ZedgbAaF/KI/RlHFBauRiWpmnKjSP
         4WMOO1yu0B7jQpCP8sWfvefkLjIcZxMc/uoSVE80XsZeAkoBTw/mPHntuFJHshdU9T7I
         CUJ7lEfMKizgYibik8iau71+qPqqhyZd4ISlIejjFKJ57aBoY8IxsbSg2/IGKUJHcbxv
         ClBA==
X-Forwarded-Encrypted: i=1; AJvYcCVIDiAcYWpP2WTOdiAU2NIAD2lCmYVSqIpjl17YvSPcwJDiuiwzsS+CKd2EmbjHFdX0N8BrPUl5p2b5cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpoQmA4SK57v14ZVTxn5CZer54yq8T7ufzDKGf7yqVw95pJtwT
	bdjpOtNTtSTN8Wai+1xmfXVHHAQOh6HYd34ul20m5s8R2IIubJhW
X-Gm-Gg: ASbGnctmZ/LG6gGQXaRv2aEJc8F9n/rj/IdNk96lrjmaX750qtC5Mq9xme/WBjA1qs3
	iqqGNgPynNj3ec6WZmyR+svP/A/sVNwVwh1Ql+oBYKAsbVfen4q4xyCe2hhlHPsi6vG9NMZOe7I
	W1o9EnpqynXKVFMdNphAa78LqFdIn6G2WO11hP2ZnpsdvjLOfhPDYVajhm53/vGK06UErIvJqpe
	DnbfVpy1mlL5DWXzEd/zzrwpPjKTW4gN+kj5b2HBMeUzSDrj9ez6KhhnJLZ0EaxJIDKbB1d0eNp
	Bit1Vu5SR+D30ThqMWoN
X-Google-Smtp-Source: AGHT+IHEPw9l2lckImW21hc5WfLjuKibfw20oGZVWj/fM/Sh5wIaMnFrYyjNGc7ye9/ekqZxC0bumQ==
X-Received: by 2002:a05:6a21:3a4a:b0:1f3:194b:30ae with SMTP id adf61e73a8af0-20179780638mr6529548637.1.1744429837641;
        Fri, 11 Apr 2025 20:50:37 -0700 (PDT)
Received: from [192.168.101.248] ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c210esm2476926b3a.41.2025.04.11.20.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 20:50:37 -0700 (PDT)
Message-ID: <dc4cc121-9e75-45af-98c1-5a4c0802e2ca@gmail.com>
Date: Sat, 12 Apr 2025 03:50:17 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] dt-bindings: thermal: sun8i: Add A523 THS0/1
 controllers
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>
References: <20250411003827.782544-1-iuncuim@gmail.com>
 <20250411003827.782544-7-iuncuim@gmail.com>
 <174433447237.1635065.9681378963946489764.robh@kernel.org>
Content-Language: en-US
From: Mikhail Kalashnikov <iuncuim@gmail.com>
In-Reply-To: <174433447237.1635065.9681378963946489764.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/25 04:21, Rob Herring (Arm) wrote:
> On Fri, 11 Apr 2025 08:38:26 +0800, iuncuim wrote:
>> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>>
>> Add dt-bindings description of the thermal sensors in the A523 processor.
>>
>> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
>> ---
>>   .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml           | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.example.dtb: thermal-sensor@1c25000 (allwinner,sun8i-h3-ths): clock-names:1: 'gpadc' was expected
> 	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
Thanks for the reply, I didn't know about this tool, I will use it in v2.
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250411003827.782544-7-iuncuim@gmail.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
Yes, I forgot to point out that the patches are based on 6.15-rc1 using dts
patches from that series that didn't make it into the latest rc:
https://lore.kernel.org/linux-sunxi/20250307005712.16828-1-andre.przywara@arm.com/T/#t
I'll add that information to the cover letter.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>
