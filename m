Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5771315575F
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Aug 2024 09:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724490517; cv=none; b=VU4bfC14BMwGVDLPtXIBlzZvLkR6juPuOK0OsYnRU667l/HeEN1JCGT0QlPF5cpVgI21r0blK0OOtEyr+I/qXgi6MmSycbLTQpcIc/1cX89o+Ld0hUmTNNzGSBpr0AY+dYyHD33PtnGcfCM/baHUL0J35xUT6ff99pVgORFu06I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724490517; c=relaxed/simple;
	bh=dnrq3nAfAIjKHv4vgKKORz9Eu/PVTF68C2/MjqjoGgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GX1le8ihz3cHo1mbs7KX/A3iG8j6uTorG9q2eFLKx9UhYQw/xMH/66fm/NWhAWSrd/P2FjqsRzgsikSWLg3JnPmyr5zHbh3cNQJ6fq0w6zeiHMJSvUYpgLxI8YPsP6uTLmUu+pIBiBWaveH2LbtfHPe4zRh9V7xhDClwzTr1qc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d542RUpj; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d542RUpj"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52f01b8738dso2069899e87.1
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Aug 2024 02:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724490513; x=1725095313; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SzqC+bM7GYWxxOd8UV7RP5k+Z1ytl+o41N4B5Ixt0pU=;
        b=d542RUpjgN9uUswgufMFfB5P+/kQWr0hHBqhRD4BohQnUTinh+4e4isffcG1V2lcxi
         fx8iesgxKdlOTzH+5zkQfwMSdEMArmSX8hlB4QDAbnIzeDldcljou9sy2iQyEJzgQ7iM
         0qaNW3nfwVXpNvMEay/49WwyHCUxMlLKX6q1FHiavV5SgxGGTDw5Ah8tQj0uM4/gZda6
         Yck6NZSVzz0T3bFJy+PXlnbokjNRuLNxXEWMymyEXTh8Z+SN40/9CUDJ1f2xLuh/BG1X
         /4LBSKAjurjFABQPsaZZyuHqf8plTJ+dr6Z/MLwHBsj6stt5PqoQ0IOamnC1ksIwBrj6
         Ozgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724490513; x=1725095313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzqC+bM7GYWxxOd8UV7RP5k+Z1ytl+o41N4B5Ixt0pU=;
        b=KG8vXNguStekcBGNwPvb9dAjTc2Zk71r+t84zoPh4vprRP8i+iNzqvedowH+mDc3Un
         bGZTpmHg33lT7IYNZliygUh17vRun6TLh8KkhDPTHLp0tmYOOfRYjNXRk3vo0anMwRTe
         l081vQ29j4l39Ry65u8BHqVgj3P/bhKVzMWdP/LG04eJIkygqvpsH4dHZrg6gUjA9REV
         3Gk0g1U52VpIL217yTx0fud4NXpNl0oBLQHrnboHpZ6hFhXeXoAN6w7fTTTR792wRB5c
         /Vhw6iEvzj5uD5zMiduv3JD5pM/M0XlrHispQvucDg6/vnP20HQA2CYT7aGbPt/Yep0w
         eX3w==
X-Forwarded-Encrypted: i=1; AJvYcCVwX5s2pe+GWtiQwKMi++mxiJLMDsuu+dMjezyEVfJjCXhTcCEIK6j55qs5pzgXc0LTIJAdcsDP5IxgFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzJQAQh/cvWqVY/WIUX3PGdhNwLtqRE3u7GbSqWeERRf19T138
	vQh/qMmVbwWExp85k+j1HohdZl1PY2MgdzjWlj91LvkHke6gWH7C
X-Google-Smtp-Source: AGHT+IExt61YW91dFLoRQK40P3IQvtOL+Im+C3TkCYSJOahFeS8y6zD09KodCzTpbndKpy1DrbtyrA==
X-Received: by 2002:a05:6512:1390:b0:533:c9d:a01b with SMTP id 2adb3069b0e04-5343878403emr3348395e87.29.1724490512566;
        Sat, 24 Aug 2024 02:08:32 -0700 (PDT)
Received: from [192.168.0.241] (85-193-33-51.rib.o2.cz. [85.193.33.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f47d1easm372626066b.160.2024.08.24.02.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 02:08:32 -0700 (PDT)
Message-ID: <51f28d92-f670-47de-8e2d-53cbecfac081@gmail.com>
Date: Sat, 24 Aug 2024 11:08:30 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PATCH] arm64: dts: sunxi: nanopi-neo-plus2: Add pio
 regulators
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240824-b4-fix-nanopineoplus2-pio-regs-v1-1-7c5f7da445af@gmail.com>
 <761f18d4-9274-4983-a128-94efb96e1c59@kernel.org>
Content-Language: en-US, cs
From: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
In-Reply-To: <761f18d4-9274-4983-a128-94efb96e1c59@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I am sorry if the message is wrong, this is my first patch ever sent to 
the Linux kernel. I have checked the schematic of the board and it 
shares the same power line with mmc0, so I assumed I can use the same 
regulator. Thanks for your feedback and I would be glad for your further 
response.

Dne 24. 08. 24 v 9:40 Krzysztof Kozlowski napsal(a):
> On 24/08/2024 09:09, Kryštof Černý wrote:
>> The board does not have a dedicated regulator for pio and r_pio,
>> but this fixes the kernel warning about dummy regulators being used.
>> Tested on the actual board.
>>
> Judging by commit msg these are not correct regulators. Please do not
> add incorrect hardware description to silence some warnings coming from
> OS. Either you need proper (correct) hardware description or fix the
> problem other way, assuming there is anything to fix in the first place.
>
> Best regards,
> Krzysztof
>
