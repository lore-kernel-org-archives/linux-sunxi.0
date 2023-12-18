Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813F373478
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 19:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmHlX/GI"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a2369d9b04aso109136066b.1
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 11:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702929391; x=1703534191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSOucPhy8Uq24Amn7av5EziiKi3zQUdPVY+HVNazcmw=;
        b=hmHlX/GI3DtRXpOth5e2HAlNajS+msTYEsYFcRnwq/5de2GVl/RCbubKKca6KHCYKd
         PrtpftJxXSwVg52gHY9WezDHUI4fPjqERO/cx6sHr3jkJZKDOKTdkLxjZqgexQmgoDSc
         PRliRM+j9qzQxZjrMjgGns5MPqhYgvGewNGj/729SDbFR2XgbOiVzTsI0eZ90ml1O/2R
         tv8dmhgXVNGpKZZpC89PGRFUDWxcASbE3OsSH8VD4dAYVI+0mRk/H7P8gdDLBy0zgytI
         GRSjXVe5BG82Vl6yCxJ4cp03hYmTu9QOouUFMzQtqCdMmyL77DBM5o5njABvt9WJA5em
         ht/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702929391; x=1703534191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSOucPhy8Uq24Amn7av5EziiKi3zQUdPVY+HVNazcmw=;
        b=Z6lMhMIJFPl/T0n6UW5pG2uu6wzpdV1UfUhEKwhavi4f2QZL6at6BF2DyfRENyU4BL
         pIxzWe/vbozZ+3y2qAgg/KlCDCxdcuWwQ483jdex1liKRYh9c99gbgXcqiktz8cam8iE
         lfkTf6SWS/CLPd0gzm+9MXZtlVzeVbE3PPe5BoGbbJHvARu82xuX8HyYzNQsyqeaLgay
         ak6xBhloJtfGOTJWKxrAEaFEhJKfWD9+X1uOxJVoSWgrUODbEXDuH0ThdwzMiAr71MCl
         Qk4yQdGo09nWDWHH8OBfrpWknkRzukMd25+tFZc3uEj8IMUJakObRXIXQBelMqOGlRBw
         o4MA==
X-Gm-Message-State: AOJu0YyZdU2J1R+Bo8hCk2RDaFe0WdWacnipfemYWgOgdePqXc8P4LO5
	g987BKHccucEb5ryXHgUYJM=
X-Google-Smtp-Source: AGHT+IE7TmqHMKHKgZX1NTAreBGHNdqmsN91K3ft/OadYBs8869eUaoyHQxBBrQWWA4Y9Z8CFr6cMg==
X-Received: by 2002:a17:906:de:b0:a23:6708:cdd0 with SMTP id 30-20020a17090600de00b00a236708cdd0mr597284eji.88.1702929390578;
        Mon, 18 Dec 2023 11:56:30 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id vt5-20020a170907a60500b00a1d38589c67sm14604413ejc.98.2023.12.18.11.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 11:56:30 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-crypto@vger.kernel.org, ovidiu.panait@windriver.com
Cc: linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
 davem@davemloft.net, Ovidiu Panait <ovidiu.panait@windriver.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 7/7] crypto: sun8i-ss - Use helper to set reqsize
Date: Mon, 18 Dec 2023 20:56:29 +0100
Message-ID: <4854975.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20231218164649.2492465-7-ovidiu.panait@windriver.com>
References:
 <20231218164649.2492465-1-ovidiu.panait@windriver.com>
 <20231218164649.2492465-7-ovidiu.panait@windriver.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 18. december 2023 ob 17:46:49 CET je ovidiu.panait@windriver.com napisal(a):
> From: Ovidiu Panait <ovidiu.panait@windriver.com>
> 
> The value of reqsize must only be changed through the helper.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


