Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F91364935
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Oct 2026 02:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821857; cv=none; b=rFJYNYjJXO0dEfiwKPhU7FZ+MMPcYw667c227hV/IlpAInPhIzyrVGX/8Gn4C8rx1R8Hzbo1XJvNn8mDAMGJ5Tq30YnuRZfwX2DIpu6ckaO3F94wifLQWGMR+UPJOnl3VFH2EX0cCtwhZc9Lj9v43FHxeZezsHLk2AsvJVrGpCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821857; c=relaxed/simple;
	bh=Qzj5pGzraqskHEzdoWlcKw/mKFLKYJh0TTlOiEgA/6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4befTQfpQWVihfkhPWDDAO1NA70TkomoazkUnjOmp0TvnbOPztvcu95JNa/Tm1AAk5axz7cDfx+xW28YXTYA9ViP7WRkXlHAwuC2OTPsK4KsTe1LzjnYT3eyC8xSwxr6BIXmTHbKbSO1N/O58dYxPID51vxN2TEdmNYkLJ3boY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZckzS749; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZckzS749"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-888148d08d3so265693b3a.0
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 19:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821855; x=1791426655; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLV+YqotDLXxDawySKCdSBP/LHKYRIWzAMZ3fLidsa4=;
        b=ZckzS749rvuQoJmXfNlFJgiQZSbWGmHzJcnHq98t5pbWm2RfRzPsBZsQZstIlZAgAb
         EcOVVqXH/TK0FeIHqClrDQMc4f2qObXFkP1CfpIpEmQJVBwol6lEi5e1nNI9o/CstD4R
         Bh9iU1QDDlucfchh2PW6oxfzdoKcjS5Jtcu4qmlMwkTv2p0WdOhcRVFxyehPjWb+PQxH
         xF/ae775eU3T00qF9fwX4P/8hqF5W+k46lSo55nblFa/bB96G6WNIoguHp8q0oI724eG
         SLqN3Tn5S0XQFESOAbzVEg1FSDHMBoxP9Y0vnOaH2T53B7mFmJOH72LPPFjgEtzaC2KL
         vTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821855; x=1791426655;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLV+YqotDLXxDawySKCdSBP/LHKYRIWzAMZ3fLidsa4=;
        b=HLqhlK5AX2jczDd1OfXLKdhc0tgFFQ/+iqgWL3aRJP4+sszABJSVhRNKJc7l90hZJG
         FehAG2XHwEbIsV3JXuF2n4Gs0ir4mZ1Q0xGKLGgPFGgDWVb4X2VngOtC+ifK0F5fQUjW
         m383zz3aAX6ooWDkXke15lDYYk3acRyHiS07e0W0KLYPal5BTt2Jy59Q+7UVxtSE5xqT
         6tGWVv4AtNfL0klU2cZJ8LPFVhyfqQTrdAOToMoB5u4ilUJyb1hQn/V08g4YuYfEMb5j
         nm+EFUX45dT9MZP9LKe9Eva/9V1YpExtSYrbul+czX4OmWatmGk4Qyl+F/O717pNfMIv
         zKUw==
X-Forwarded-Encrypted: i=1; AKwUvBxq3LrVIxYcy31d3Hy/2tP+bRRQ8X06eE6aOsy2y3gNQtU9RoKOU8fI6MJM4Pg0sRUbheIPirUM+H407w==@lists.linux.dev
X-Gm-Message-State: AFuF++nJNAZBjDs0z2XeLCAqfk25sH8c/gnRFsrI7v6kD8UWkCh+tKEm
	nI4ShQlFY1+son335RjVd8lLclwLxqkUXUadnXlfKkboZ846nupICxIneWM4fKEouzs=
X-Gm-Gg: AYBFou3eZ+xdhYsu0nT+oSydb/f8Sjr02f2n2A5gXXLvzW/UYW2sAM8otqGTNcOgFMe
	zr5wJyjAwqdc+bs56fYdil+vDkzJlgcpUU964FHGALeVfF2goZbmSj2Y8hdlspsoNg+ve4sh9DJ
	z6XBBFDEYw5zbyEYQbdPmIHrW0R80kDplxnlX7iEybcqrIMWFSXoFp5zHkd8EJj8SN1EGPquueS
	TQs2VEAwptfd3fNIPVEn6jrY++3iF16mc7hcPCvIv9AnMJ65zB4zDkNRtidYuDJXclS7AamCRml
	6mDefVa8rBZMS9G1XGkDLybuGyZhcWc4TixpWVWdm0va87w+L/VtwiSaZ1/DO3CfaqAt9fzh1QG
	bKkbjqIxY3bxBz3QeZfagkHxDkM5yXhmcpuhCctUMZI5u3FF3vfnwTx/jph2JVfCrkRlP2Nu0qo
	oeSM+jJQrCSUfnDApPHe/yZe1sWTz2WPKbRrjFounWBjhowy1AaA==
X-Received: by 2002:a05:6a20:260a:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3de9e02b82emr2903360637.9.1790821854823;
        Wed, 30 Sep 2026 19:30:54 -0700 (PDT)
Received: from [192.168.101.188] ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e539b583sm676858a12.2.2026.09.30.19.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 19:30:54 -0700 (PDT)
Message-ID: <36bac55b-c7e9-40e3-b376-fb8d163fcd40@gmail.com>
Date: Thu, 1 Oct 2026 10:30:41 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: thermal: sun8i: Add A523 THS0/1
 controllers
To: Rob Herring <robh@kernel.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li
 <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 =?UTF-8?Q?Juan_Manuel_L=C3=B3pez_Carrillo?=
 <juanmanuellopezcarrillo@gmail.com>, Andre Przywara <andre.przywara@arm.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
 <20260913145527.18148-2-iuncuim@gmail.com>
 <20260924151758.GA75925-robh@kernel.org>
Content-Language: en-US
From: Mikhail Kalashnikov <iuncuim@gmail.com>
In-Reply-To: <20260924151758.GA75925-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/26 23:17, Rob Herring wrote:
> On Sun, Sep 13, 2026 at 10:55:23PM +0800, Mikhail Kalashnikov wrote:
>> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>>
>> Add dt-bindings description of the thermal sensors in the A523 processor.
>>
>> The calibration data for both thermal controllers (THS0, THS1) is split
>> across two nvmem cells at different offsets, requiring the two cells
>> to be read and merged. To maintain backward compatibility, the name of
>> the old cell remains "calibration" and the new cell is named
>> "calibration-second-part".
>>
>> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
>> ---
>>   .../thermal/allwinner,sun8i-a83t-ths.yaml     | 34 +++++++++++++++++--
>>   1 file changed, 31 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
>> index 3e61689f6..792081af5 100644
>> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
>> @@ -24,6 +24,8 @@ properties:
>>         - allwinner,sun50i-h5-ths
>>         - allwinner,sun50i-h6-ths
>>         - allwinner,sun50i-h616-ths
>> +      - allwinner,sun55i-a523-ths0
>> +      - allwinner,sun55i-a523-ths1
> 
> Why the 2 compatibles? What's the difference between them?
> 
> Surely this has been asked already, but nothing *in this patch* answers
> it.
English isn't my native language, and I don't quite understand what 
you're asking. It would be better if you just said, “I'd like the commit 
message (or somewhere else) explaining why two compatible string are 
required.”
Thank you.>
> Rob

