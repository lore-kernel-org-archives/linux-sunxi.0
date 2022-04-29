Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B80B10E8
	for <linux-sunxi@lists.linux.dev>; Fri, 29 Apr 2022 06:04:02 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id a10so7571451oif.9
        for <linux-sunxi@lists.linux.dev>; Thu, 28 Apr 2022 23:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language
         :from:to:cc:references:subject:in-reply-to:content-transfer-encoding;
        bh=X/KcFNZhAHoZ1H6Tr4WvcjaMczJznMSErZBotqKY3jk=;
        b=PxhNjBOw2ylbQzoWSUcKoIuVMYGb/l6sxtEDteNu6AO+5YMtyA256PNa3JlRIRzM+L
         ijSIySGeJpUHMeXZTKHsagxc/ujgW+UfOit8Xhfp0WtlPe/tGMEsbntzX149xTm+Ewic
         njMJr3IjP6E8YT38D97JampAL4qtJ7h7T36pulJNSiy9qSxN10NFsKStjF3H/oHT33QK
         E/RoWon0gJ6V5OC1x6Ukk7545Tn3PzgVRsSC7Q/gedvTBhSbDewSG9jdr+f6ndDW4HAG
         8O6LZm2d5LwL7k1kwdzVrSVIt7fWf+QpJ2iyi0OeYDSc9rT25u5SSLRKE1O3FEguyZ02
         zqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:from:to:cc:references:subject:in-reply-to
         :content-transfer-encoding;
        bh=X/KcFNZhAHoZ1H6Tr4WvcjaMczJznMSErZBotqKY3jk=;
        b=Cz8MiXwQdj4XcCgv5c/bpB/fgbS/1FDklYqFUH7XzkoppSk4BD4ueP666v3gFsTKul
         ax+Y2Ul/dPvu+qzX3woznfUCXRs4jcnTw+o1+Fj/13HxFWKPOaqfoMwKx6ePyhlr2QXR
         So2caxsLYvW5eMt+UoIdCAogoRMuLKmgOXLNH5R6G5qXfA/EP5vxxII1LkZr1mdnW1Ef
         Cpa2C97cy7RajspzeDArakZ0toVUtpKQ0QEM0XAD6JJ6S4Jf8iUAHJ05GGuRRP5OEGms
         1ZlnIn03x1IgAaQoRSMzB4h4J6vj221CWK443qo+015JiangJX0dX4mEP9hIwedS7FjC
         qi9Q==
X-Gm-Message-State: AOAM533teM7CO01t1UOfe57O+FOwyDdNUpF7RulDugo1WAnPpXK6GBYQ
	2tO9gEsOOsdAl2WuW5AXnmk=
X-Google-Smtp-Source: ABdhPJwnRWg5pq2rb86Qc8RTFC94blcskTiFA5sttrDQRIupMO1KOk3leXNWAUY1RnkOtxc0Psq7lQ==
X-Received: by 2002:a05:6808:1912:b0:325:74c4:35e3 with SMTP id bf18-20020a056808191200b0032574c435e3mr788022oib.61.1651212241626;
        Thu, 28 Apr 2022 23:04:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a8-20020a4ad5c8000000b0035eb4e5a6c6sm429034oot.28.2022.04.28.23.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 23:04:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <59e91f45-7263-eb41-4b47-db217af54910@roeck-us.net>
Date: Thu, 28 Apr 2022 23:03:58 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
To: Ruslan Zalata <rz@fabmicro.ru>
Cc: Jean Delvare <jdelvare@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20220428210906.29527-1-rz@fabmicro.ru>
 <f79a8edf-36d4-02af-da8f-32b4e491bd47@roeck-us.net>
 <e0b57c7587dded38a92411994f353b3d@fabmicro.ru>
 <e4d1a6c8-1afd-671e-76bf-b5bde9dc282f@roeck-us.net>
Subject: Re: [PATCH v2] hwmon: (sun4i-lradc) Add driver for LRADC found on
 Allwinner A13/A20 SoC
In-Reply-To: <e4d1a6c8-1afd-671e-76bf-b5bde9dc282f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/22 22:32, Guenter Roeck wrote:
> On 4/28/22 17:28, Ruslan Zalata wrote:
>> Thank you Guenter for your valuable time.
>>
>> I have added update_interval option (it's in ms units, right?) and fixed all other issues you pointed to. Will test it on real hardware and send third version of the patch for review.
>>
>> Regarding IRQ. Alternatively the driver would need to sit and poll conversion ready bit in a loop which might cause a much worse load on system, is not it ? Anyway, the real problem with this piece of hardware is that there's no "conversion ready bit" provided, the only way to know data ready status is to receive an interrupt.
>>
> 
> Not necessarily. The data does not have to be "current", after all,
> if the hardware is able to continuously convert. If not, the question
> is how long a conversion takes. If it doesn't take too long, it would
> be better to initiate a conversion and then wait for the completion.
> 
>> I think it still needs a semaphore/seqlock to synchronize conversions and reads. I.e. two consequent reads should not return same old value. Although it's not an issue in my case, but could be a problem for others.
>>
> Why ? That happens for almost all hwmon devices. They will all report
> the most recent conversion value. Some of them can take seconds
> to complete a new conversion, so the reported value is always "old"
> for a given defition of old (ie any time smaller than a conversion
> interval).
> 
> Sigh. Looks like I'll have to dig up the documentation and read about
> the ADC myself.
> 

I did, for both A13 and A20. The ADC supports continuous mode. That
means it can be configured accordingly, and reading the ADC value
just returns the most recent conversion value. There is absolutely
no need to keep reading the conversion values using interrupts.

Also,

+struct lradc_variant {
+	u32 bits;
+	u32 resolution;
+	u32 vref;
+};

is unnecessary because the values are the same for both supported chips.
That means that defines can and should be used. Yes, I can see that
A83T uses a different voltage, but even that doesn't need a structure -
the voltage can be set in struct sun4i_lradc_data if/when needed,
and the resolution and number of bits is still the same.

Guenter
