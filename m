Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EE51E48A
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 19:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713381779; cv=none; b=NzZy96FQE8dI814u92TMjgGWghZKhIxTXvnsqpf8YRWf0tBSzUhUTJ2q/iDwA/DEOgzqz+Nncz+O1lXhRm6v43a5FsN0W8jUMSW5K+0hRzZBdp7o0Z1LVgc13eZh2SRU/rcJd0mQR9pj2L58ErR3J5Z9+xndhxC8PNB+ghNt1fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713381779; c=relaxed/simple;
	bh=nJnNEQdeQQ57jDWZibkD9rYJD8GKCztN4yUoTC0ua3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KeJqUtYbXpwA1+jMVMiP10NAyU6PWtK04lzAo7GBSvhm5QUsBME4W8NWADLahnLc6mxoJROI4yk/D/DwNthxrlXwn9SmxTB60cedN01LggAQEerZZ/dW9m8N1xZaZfMN/JOR/Tc2HOBPP6qxm6R3uNYyRgwfO2/g0o57LW+9Bx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GPJG53v9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GPJG53v9"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ece8991654so128496b3a.3
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 12:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713381778; x=1713986578; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wq9xVwLabUIp4c6ZmP5uA7mSaarqFyL70j0nvluua5U=;
        b=GPJG53v9ux1XkIi43dbP+nZJ7dKmKWcZGbxH1e4CkVcCM/KrR7WoWnGQ9s12n8SRGc
         CRuFusckZv0JtraXo16xyO9YI7QLhJCcf0gFTx65sVfWaEYbal/hwAgrGXT/P4zUnucG
         xStKQxEun9aD7aANP9c/M49LY+KV+7/ALoQnIoHgjmpUMuBeVgvUxFJ754d9DMiBKINR
         HcyZ357yNnkDSvMDGr58fqoB3ltq+J8rdsa7wX2yP0Y+Rr6FVUG9a2ZdGa9Cc52KXL1u
         IOafNCr8F7+LhPIuSI4XPsjrCLkUTfFPNOKAdHj1LjqzTc2U8u0NBZpfCXplbDzRkWUP
         oFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713381778; x=1713986578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wq9xVwLabUIp4c6ZmP5uA7mSaarqFyL70j0nvluua5U=;
        b=J0NBpDcZKDUMPLCWTs9kAT7H9mLHlegDPd5BmLSMWeqEHSoKT3lm9S28qHbvsD1UbJ
         QxLlw+PiLfaEON/nwX2Y9Q/AxSN4LRBpm8uUEPz5ikgfae16aj2OlPu27LnSTeCgV//A
         cpiQULe+40RW846cHjCElGhaFj4GA3vLFbwe6MQmW8t92EUTgMw3+QEBdBYQeS3+q2rs
         S7/DZeNv5sG/b54RG1UBhG5FkseWbrF8BPubhFlXTIcMVMH4dImwiIEO7VLRTp2W+2pU
         7pRw5TGpfDBhnIga957BFb2dgxyG6R0LKrGWqNlmV4yGoiRxiszADEJtylFZBtqQUUnP
         uWZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAvZVZFYrqh8tMpZ+VOM9WlNPH5YknWSAbpKIX1ZFljQuNLYIirKMHhyerstweYKkV4rJ90sgc5YGON3usKlgU+UYThWLKt8sGLgc=
X-Gm-Message-State: AOJu0YwGj4HksE+xfpChbzNIBILAgsy4kJs522dBBk6+mRUDbRADqM3f
	YIEIktudghwvoUPlgzKB3Mf6D8EHkw8K1WtG85kOo5d4uwwTPKZ5RUCawy3oahg=
X-Google-Smtp-Source: AGHT+IHpCZ9iorWUckM+AfY914yJi7UOR8EUvyEahSdKSnOn9Tc9Fyj1s44EVltsOqBrhQ29U5OmkQ==
X-Received: by 2002:a05:6a00:2d05:b0:6ed:de86:be57 with SMTP id fa5-20020a056a002d0500b006edde86be57mr599948pfb.25.1713381777740;
        Wed, 17 Apr 2024 12:22:57 -0700 (PDT)
Received: from [10.36.51.174] ([24.75.208.147])
        by smtp.gmail.com with ESMTPSA id r13-20020aa79ecd000000b006ed045af796sm13383pfq.88.2024.04.17.12.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 12:22:57 -0700 (PDT)
Message-ID: <a31f5422-f668-4302-a563-0f5b9190259d@linaro.org>
Date: Wed, 17 Apr 2024 21:22:56 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: sunxi: document Anbernic RG35XX
 handheld gaming device variants
To: Ryan Walklin <ryan@testtoast.com>, Andre Przywara
 <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240414083347.131724-2-ryan@testtoast.com>
 <20240414083347.131724-3-ryan@testtoast.com>
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
In-Reply-To: <20240414083347.131724-3-ryan@testtoast.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/04/2024 10:33, Ryan Walklin wrote:
> From: Ryan Walklin <ryan@testtoast.com>
> 
> RG35XX 2024: Base version with Allwinner H700
> RG35XX Plus: Adds Wifi/BT
> RG35XX H: Adds second USB port and analog sticks to -Plus in horizontal
>           altered form factor,
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---

With the assumption this matches existing coding style for sunxi:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

