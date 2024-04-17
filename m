Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CAF8F72
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 19:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713381746; cv=none; b=lRz64bYKSsikX0X2HroVkX9gwAMHE3b+pf3i1GpEewYQwAeebByWInUptoyx3WJFz6X3bs9lWSU86MLP095Vv51xa0cdZeRtYyHhHTC+Y6Xk2olibkK3qhH+JcFb/9rPyCYDwYyWuBZr0J4qn4vilEDJUnDbf1jCS7TjkRm7S0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713381746; c=relaxed/simple;
	bh=z+Ce9DbnjRsePR4jNOyZRoMgYnx9XHKosZ8nhT+BWAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gv9KmsR4QSnNqci5GFDTZzQt0oLns4p18vYPJJMtR9SR+CXaLhoj1h/CmU1kln/pWcf/HdKtllsa5RGzxNxE7H3ROBSYBALzMubjhP33R2BnWmRBy6evex8bG5CAmRsGL+e/xsqxxVIpt7hkioLSEqV+PAh1XlHL18HW2aPasXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aAUaRnHD; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aAUaRnHD"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e4f341330fso997175ad.0
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 12:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713381745; x=1713986545; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e07lLC3xipl/CxUox78LWe7AXy9rb8hp7FKMwF6DNOA=;
        b=aAUaRnHDaS0LzTQudTOVd0iFV5Bko/QlXuwzjw/PkLOsTU1IPPogI1GRfNHZqEVFhF
         NIC0p5K7lmPUbi3jSv9tC6QVe5/X30UAfC+qiED3qDYjyUFCIgXVRXTUDm5cmty/PznC
         iNIoHsGfXCtb5AiH2Rc5uZlMpktqh85Gqr5KkOY1qf7+ZxtSIMAGp6RBU30OYCpN/8AG
         xVSvzR7BKUolojKXw35whGDkOP6Y37YOGKQcUZpA0f7RdEzAOCqUL8izxLowcxP5Ya2h
         4P+kOJzmz1ha50YG/9tJNphRAHSMyfr0nK2C3iHtJ7k9ReTUc2Y1T0fNmN52CUSb796g
         VOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713381745; x=1713986545;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e07lLC3xipl/CxUox78LWe7AXy9rb8hp7FKMwF6DNOA=;
        b=AyeCZPS4Sel9s69ykreyoeK4uKut+DnMDr9CREqdU12NH4qvB7FgVElCSveZajQiyC
         LEeYSSVMEcCm4EPAwnkRNv35j1jm493rqr8sfX1LviPvISoBl5J+7LaSWCic8QRNV5BA
         Iriiz1xX5zgu5gsziROTlhOaZCgQnZZ3B7jkvWbEJ60ah1xEHGMMVsH6bO11mDz1w4qX
         PMfaVTBCjvLB8epErhaXvDqmQCer7lgiIgrslMU7sAqPg5XhGI2Rxgt6mE5YeLn2+ZEH
         fedak7SRc/IvvAaMPXeWW3109uTXcaBNGSzxLw1ySo4GfjphVUNp/VGPMtDeuiaANjDO
         gbag==
X-Forwarded-Encrypted: i=1; AJvYcCWDgF6p0yuWUZzeYtAvIjFNT2D6JMZ7TyTOR4b3QSfph6jYNZBXfiWdNC5uY/FigoomgS1f8Tk6mfLVnN7Cp/3NAKaFsC0DMmZmynE=
X-Gm-Message-State: AOJu0YyIqd/SeFH/L3dl+LqnKQVYfaQPwJcCY0BoXRxtbKG75RNJJsm4
	D1shS1OVoR8vnRVOCmQmE64HO9KnCNBFDV7EbW660k1Hi2DjqZE3xR6MInvOHXs=
X-Google-Smtp-Source: AGHT+IEVYdUoem9o49l8lNKaUbCYC2Wzvl1sVqsckB/9PMVpehsVMx48aEA/tVd4qDvcw6UlD6hIig==
X-Received: by 2002:a17:902:eccd:b0:1e5:9390:8437 with SMTP id a13-20020a170902eccd00b001e593908437mr383503plh.32.1713381744632;
        Wed, 17 Apr 2024 12:22:24 -0700 (PDT)
Received: from [10.36.51.174] ([24.75.208.145])
        by smtp.gmail.com with ESMTPSA id a20-20020a170902b59400b001dddbb58d5esm11902045pls.109.2024.04.17.12.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 12:22:24 -0700 (PDT)
Message-ID: <32d6c63f-7350-4445-a10f-2d89ef9e52f4@linaro.org>
Date: Wed, 17 Apr 2024 21:22:22 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: sunxi: document Anbernic RG35XX
 handheld gaming device variants
To: Andre Przywara <andre.przywara@arm.com>
Cc: Ryan Walklin <ryan@testtoast.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Chris Morgan <macromorgan@hotmail.com>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20240414083347.131724-2-ryan@testtoast.com>
 <20240414083347.131724-3-ryan@testtoast.com>
 <78b5de01-150e-4537-b6a6-8ca0067a8359@linaro.org>
 <f0b5aea5-54f6-4c3b-9c16-f7e97c58ea6d@app.fastmail.com>
 <ec2be6d0-68ea-41b5-a12c-5f926c7a8f81@linaro.org>
 <20240417145854.46827456@donnerap.manchester.arm.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240417145854.46827456@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2024 15:58, Andre Przywara wrote:
> On Wed, 17 Apr 2024 15:33:13 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> Hi,
> 
>> On 17/04/2024 11:05, Ryan Walklin wrote:
>>> Thanks for the review and feedback.
>>>   
>>>> Any reason these are not just one enum with three entires?  
>>>
>>> No, this is just to match the existing devices, are you able to point to an example elsewhere?
>>>   
>>
>> Even for variants of same boards?
>>
>> The examples are everywhere, e.g. Qualcomm or NXP.
> 
> We have separate entries for closely related boards (Pine64 H64 model A
> and B), and also indeed for updated variants (the various PinePhone
> revisions).
> That doesn't need the stay this way, of course. We would lose a quite
> natural way of putting a descriptive name to each compatible string (cf.
> "Pine64 PinePhone Developer Batch (1.0)"), but if the main purpose of this
> file is to *reserve* the compatible strings, it would indeed be shorter to
> use enums for related boards.
> Don't know if this would a real advantage, though.
> 

If this matches your existing practice, then it is perfectly fine for
me. I will probably still be bringing up this question from time to
time, because for me it blows the binding unnecessarily making it harder
to maintain/read, but that's only matter of taste.

Best regards,
Krzysztof

