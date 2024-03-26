Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC68D13E3E6
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Mar 2024 22:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711493084; cv=none; b=YCcLwtKTXIvNmTZVSsbDz3MbgrB1QklxtEeg9p8acj+1LN42ff3vLo55rNF8y+pZ6OZetvPpjAjVJ4mseSVo82Gt5foLcfbA5oG1oTHTekdK7dDwsYJSesl3hlsEnnnKRu/Iq7AU/JGQTN9xHVCW/FTNf0N+14MgRrpcwLcpkNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711493084; c=relaxed/simple;
	bh=21njRGl940sgZBGKPtxjtRnd5br8akhXs+E2HiOd6+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dTK+7BUWgqdyX0O468EDlh4jvGCvRrskQn59duDUCUr8o/vXKgJT8kLyW6zDdrjDJM/SpS7fM/f9TLpC7+IGbmTM5maVS0vHqukzAvgiXf4X0MOx4PdHTfe0jM0To+AWg9TH9hmnbAPM7SpJ0IRHXGIdB3fjZMPQ743i4fIPtrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Swe6i2cg; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Swe6i2cg"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d52e65d4a8so81147911fa.0
        for <linux-sunxi@lists.linux.dev>; Tue, 26 Mar 2024 15:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711493081; x=1712097881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHr5651oMEvLdMR3cMJXLfEH9jfz5XxGqogmz27QaOI=;
        b=Swe6i2cgJr6M+734f1VgJjx72A9GoFLgRqFJ62OA8tNhRXSNdSROP8BROJmwBf20zu
         ROdcxFDFLw2U0YU//eLU4/J153mYmBxZh8vHfyEfh5wKSjk99Z8uYCPORZDNzQ5MzYwJ
         OaGRw6c4e3RnjUkDqwqeJpxNS8e9K88Z7HKa89aGJTbkqKUpx0W7AO9IW7esVXTKwR2u
         STdBUCVlvD6cWzR+AxHgdfLzG2UWySVfW4oXoPSRSpE9R1mbJZ8otVcot9Vo5rVDZ3y1
         4g293BNIOx4PsvkqiXvi4tjlmvMR5Su+DqTSqYgpvUA50zDmnBxEuVayHGew0vvX9baO
         y6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711493081; x=1712097881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHr5651oMEvLdMR3cMJXLfEH9jfz5XxGqogmz27QaOI=;
        b=f+T26Ky80Tn8k7wfjxXQXQYYzcT9Yz5TP0+kqfsMzQzEv0RfoBjVl+TUe4tp3Gp7Qo
         0aIYJu68W8EsMC33Cq1MvFNPRr6N0T9kbrTW1RjpNsSp1NjRqe1p96dZHDb+Y/3axY7I
         h2HlxNSIWFEbCRjrU14hpUcQcvd4bGa/OS+U5OaAzGetGjpAqH1njg8k+v1+sA6f9CdQ
         oJVTXFsutjPoETT597Pj/FkY8f4NiohNhm88w+M0erK7xTNmzE3dbveV18KVZgkbdIAJ
         5mWEyN72ALWYTyOHOVm5OmMsBYPvWaJd3Adu3NxxV8wtg5YdrZ7TLT9+zyUITO9eXCNQ
         g8TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi+l0gmvqhr+g70EcQjafp+0G71nrweZLCOcAheb5ip+HRmf9NGTJpUmDshGwLiivtJol3h/Km4dMLGEGa42SUAsOislIcOJ4kaBQ=
X-Gm-Message-State: AOJu0YwKWOifr5VDe4dKUyAjgYqRO7/8p4GV36ETR7T1ZuwHzW2RzXiE
	dV7wQjJHEsMS852dv4u0HDFu8APCqJcC71yV87wqFP0q8u0k/A74
X-Google-Smtp-Source: AGHT+IEnYDcAqXAqYEKDNyTaX59nzs/0/ekFbWyysHmdBYKs4D0+MiAouG3YSCYzVoJ9LfnudhXkEw==
X-Received: by 2002:a2e:7a04:0:b0:2d6:b424:a634 with SMTP id v4-20020a2e7a04000000b002d6b424a634mr6840536ljc.15.1711493080660;
        Tue, 26 Mar 2024 15:44:40 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id o25-20020a509b19000000b0056bcec9c89esm4786463edi.92.2024.03.26.15.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 15:44:40 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Aren Moynihan <aren@peacevolution.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Pavel Machek <pavel@ucw.cz>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Miles Alan <m@milesalan.com>, Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, Ondrej Jirman <megi@xff.cz>,
 Aren Moynihan <aren@peacevolution.org>
Subject:
 Re: [PATCH v3 2/2] arm64: dts: allwinner: pinephone: add multicolor LED node
Date: Tue, 26 Mar 2024 23:44:39 +0100
Message-ID: <3796126.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20240317004116.1473967-2-aren@peacevolution.org>
References:
 <20240317004116.1473967-1-aren@peacevolution.org>
 <20240317004116.1473967-2-aren@peacevolution.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 17. marec 2024 ob 01:39:29 CET je Aren Moynihan napisal(a):
> The red, green, and blue LEDs currently in the device tree represent a
> single RGB LED on the front of the PinePhone.
> 
> Signed-off-by: Aren Moynihan <aren@peacevolution.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


