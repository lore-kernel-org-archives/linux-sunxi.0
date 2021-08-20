Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC6E3FC0
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Aug 2021 12:55:39 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3F35540768
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Aug 2021 12:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629463735;
	bh=e6+/LPJwCnWwvmlU9AwLblFP9pPUPAQRXF2MXzGKarc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=M8CGVywXFcug97xay5x2rXg28H7w0KAAUgWM+WrZ7YLG1QiXTeLsTon82wqM/SoBJ
	 zuawysYIZUL+/8vDAytB/QT/QHaUx/+PvX32w1P6g8UhXO+EWTgjn4pYy1+/rxjFnt
	 Gt7k3LSExs+peagtlflA2kSjn+DVA7AQGEFLINCbHO2QIQ6CaETjTqXG32Y+3YWNm2
	 ARHHJmL4qk3GvY8262DcFSzChy0kbtaS5uLafSrONinznzJ9BK0Fg0hId0u/f7MoXv
	 mkkcQAJVV/ZmzRjF+nsZ5AaDA2wnfZkWkLgwP3Sd/UDBpqowebb2sVMNsBDpY03b33
	 9oLcuRdYxLkHg==
Received: by mail-ed1-f72.google.com with SMTP id eg56-20020a05640228b8b02903be79801f9aso4457505edb.21
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Aug 2021 05:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e6+/LPJwCnWwvmlU9AwLblFP9pPUPAQRXF2MXzGKarc=;
        b=lArxxJ72yK+ZWffuo9Ewuond6cihZrrr0nnb72oC5OX4IGyrxZfORMN6fGIz2VaGc3
         euFrwKtFOVZloy9xvCwHL5HC0I5UAiCmvbowtIp2JVCUWZw100kWPp/upNopCHdhjNZ3
         A1a/dL7wd2OQjf55acRiKErbiQ3m66LSbMo9HgqyZa1KeS5508P5zmchWvbsSEEOH9A3
         SOLJgTNyhdrzUO5CE8cnvc31IUcqejXs1KWp5iA0bDPkLvKn31J6PpgyS2HFrRb5xUO6
         7IQoQvQAeYwyrxSs1TM6ORYm+EY1ekRE+/iWmSpB7AbLbW8eiDJaybB5kZT7KUzx3c1h
         NwQA==
X-Gm-Message-State: AOAM531MBDz0g9mafjk3BaLYZWNURevOm17eomoVvmloPCDH7dj/nAPQ
	AlIkHfODvgB1tppQKgqq8Qb82M8JNIqtd/zYz5FzkfvXcfri1pW3EI+8s8W/u2OfwAg6whEs0LA
	Mbx6MRKgRVJpwzj4dpdQYGXUwE0mc8+GhooNnzbHc
X-Received: by 2002:a17:906:30d8:: with SMTP id b24mr21486604ejb.358.1629463733476;
        Fri, 20 Aug 2021 05:48:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzEA4LvHamf6qG6ri+17OoBEIe8kZxRulHqECry6rlL5gh8PL/y/8DEYXFpdW+LnXDSZLDtA==
X-Received: by 2002:a17:906:30d8:: with SMTP id b24mr21486588ejb.358.1629463733338;
        Fri, 20 Aug 2021 05:48:53 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id q21sm2800011eji.59.2021.08.20.05.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 05:48:53 -0700 (PDT)
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: h5: align operating-points
 table name with dtschema
To: wens@csie.org
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-sunxi@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
References: <20210820081645.83796-1-krzysztof.kozlowski@canonical.com>
 <CAGb2v66EnW+iO2CPueauRob+b53pNFEuL6LUoSYb09_TN+=_cw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <adea5de5-30db-72b4-9a65-121b0c3032b5@canonical.com>
Date: Fri, 20 Aug 2021 14:48:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAGb2v66EnW+iO2CPueauRob+b53pNFEuL6LUoSYb09_TN+=_cw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20/08/2021 14:11, Chen-Yu Tsai wrote:
> On Fri, Aug 20, 2021 at 4:16 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Align the name of operating-points node to dtschema to fix warnings like:
>>
>>   arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dt.yaml:
>>     cpu-opp-table: $nodename:0: 'cpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  arch/arm64/boot/dts/allwinner/sun50i-h5-cpu-opp.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-cpu-opp.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5-cpu-opp.dtsi
>> index b2657201957e..0b6914a165b0 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-cpu-opp.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-cpu-opp.dtsi
>> @@ -2,7 +2,7 @@
>>  // Copyright (C) 2020 Chen-Yu Tsai <wens@csie.org>
>>
>>  / {
>> -       cpu_opp_table: cpu-opp-table {
>> +       cpu_opp_table: opp-table-0 {
> 
> Maybe we should just reorder the name? Name it "opp-table-cpu" instead.
> That way if and when we add one for the GPU, we don't accidentally
> clash on the name.

Although the schema allows such name, but still the devicetree
specification says that name should be generic (representing generic
type of a device). Just like there is a "clock-controller" or
"nand-controller", there should be generic "opp-table".


Best regards,
Krzysztof
