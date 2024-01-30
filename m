Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013B47AE69
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jan 2024 19:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706641589; cv=none; b=aF/M8Ev6EbusdE4BmKT/AJcKrqre0uXJSeHGMVuHq7cXYkw32yN2jSd+VUPkOPMLDCpKaNgKCStQBNm+bFc+1wMFsqb8YTkK0JxuDSTmXQh111UzQSY6AJ+dvf7avooNFjUNP5vM6BRQ2v8IvYzrGO3+F1KJybB0Twh/GCWJWwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706641589; c=relaxed/simple;
	bh=VksIfXIm5eursDB7QN4BdU+LKTo1rpEED6YZzJNhrl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dgWAyCUH4vnjrPQXpe31LLG9cmtvL6I4UMW/E/mleYb4W0+sFpveho90JG4oYZDdpjR+jCnqgzHUOaqeqBrlizJXQzJxSqzPSQP3gpy65tV8iDVUTzjxDmjtgW3o6dJj0yOuNnicjRUx5YAPIB1v0QUH1xHoRq2HAy9/c5YcWAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXdzLUla; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXdzLUla"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cf4fafa386so47989471fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Jan 2024 11:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706641586; x=1707246386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kz5R8751++TIGV14CPH1BLDMs2sQzf7EuaPw8ShjZjA=;
        b=cXdzLUlaLSEPJRhU50JI253zfBLVkYWHODI5LsG2VSd/FaOV7mOX16feumewshkmMR
         ZUZ26Tp35athi0fpp9SMIqACTSVg2YqZtlnJsoTeSMuJ6RlIz5bh35bHTEaJ/QO/+5ox
         ug1/EzK45wsm72c0R0sAv1ypTqR5UxDCVjKbJFrZBJTqNStRhuh0zfOdLXOcOnV05JdK
         9J0WExgyG16+FrEcwfV6aEomiBkieWSv3qz5gQ5naXQHWEkd5nVOG2F3aOWQO3NCtNDl
         ZeDaRyHCFIQ1VfFckArpIN/7ZxKxEMHjv0XRJuc8y04NxOfnxMQZT8ua+0ORKrm+EJuD
         9kRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706641586; x=1707246386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kz5R8751++TIGV14CPH1BLDMs2sQzf7EuaPw8ShjZjA=;
        b=L+vf3yRPXTaAfqT8UcqlccsrevA1wSdgmH5B4RaOP6ES8ex1+Tq6BmWeJUM7LO2Mgn
         9mDBAwwCBccqj7TLUFt6+Xr0MqfEqe5MarAU4NKb11fyW6JcoOYDWCtuGEasPjtVgsBc
         OEdFuGBY+FvgRyw/3Sh0alv0OzLL2sl941xLUQGz/Y7TzM+XFJvmuL1KccbNQDeYZ+qw
         JrBxeY8MduAbLm1duzeU29xYj+1qZLZqzuvGSh2gXoT4/1KY1k6EVMEO+ErBOmMUZJXN
         5W1krtDw1FtOEIgHtvjVGbmmhMrvc4PfVio3GXsrZN22x9TZtSC57jOzgRfvGce8I7Sw
         tBkQ==
X-Gm-Message-State: AOJu0Yz9faIpiX48X4AnnMAAZM6QSuLgDh++oa37gCftn+r9y/B9gWWP
	1ET0XUD3pqMSZ2QSGMq+0WtCOFuTEp7IamTf1O2L+UkGSxgyJap5
X-Google-Smtp-Source: AGHT+IGq/0kkkMjJWaJGc/t19XDj/mXpEbDzhvS8RC7I4fDvALCvvgcCU8OYgpxN47xLUWQCljOBdA==
X-Received: by 2002:a2e:5c88:0:b0:2d0:5925:7e with SMTP id q130-20020a2e5c88000000b002d05925007emr1970000ljb.32.1706641585969;
        Tue, 30 Jan 2024 11:06:25 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id g6-20020a056402320600b0055eec69a5cbsm2979933eda.71.2024.01.30.11.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:06:25 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Aren Moynihan <aren@peacevolution.org>
Cc: Miles Alan <m@milesalan.com>, Ondrej Jirman <megi@xff.cz>,
 Aren Moynihan <aren@peacevolution.org>, Chen-Yu Tsai <wens@csie.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 2/4] arm64: dts: sun50i-a64-pinephone: Retain leds state in
 suspend
Date: Tue, 30 Jan 2024 20:06:24 +0100
Message-ID: <4892315.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20240128204740.2355092-2-aren@peacevolution.org>
References:
 <20240128204740.2355092-1-aren@peacevolution.org>
 <20240128204740.2355092-2-aren@peacevolution.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 28. januar 2024 ob 21:45:08 CET je Aren Moynihan napisal(a):
> From: Miles Alan <m@milesalan.com>
> 
> Allows user to set a led before entering suspend to know that
> the phone is still on (or could be used for notifications etc.)
> 
> Signed-off-by: Miles Alan <m@milesalan.com>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Aren Moynihan <aren@peacevolution.org>

Where is patch 1 and possibly cover letter? Please resend with all patches.

However, this particular patch is:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> 
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> index 87847116ab6d..ad2476ee01e4 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> @@ -43,18 +43,21 @@ led-0 {
>  			function = LED_FUNCTION_INDICATOR;
>  			color = <LED_COLOR_ID_BLUE>;
>  			gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
> +			retain-state-suspended;
>  		};
>  
>  		led-1 {
>  			function = LED_FUNCTION_INDICATOR;
>  			color = <LED_COLOR_ID_GREEN>;
>  			gpios = <&pio 3 18 GPIO_ACTIVE_HIGH>; /* PD18 */
> +			retain-state-suspended;
>  		};
>  
>  		led-2 {
>  			function = LED_FUNCTION_INDICATOR;
>  			color = <LED_COLOR_ID_RED>;
>  			gpios = <&pio 3 19 GPIO_ACTIVE_HIGH>; /* PD19 */
> +			retain-state-suspended;
>  		};
>  	};
>  
> 




