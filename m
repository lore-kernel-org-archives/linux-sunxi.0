Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CAC482C7
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Feb 2024 17:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707155882; cv=none; b=eU1Vhf46Z0DM+8v9RgFJ33Ldiu+B1sSOc+pDhQPzeAMJp2DIF0p8thOSqvHsORV2oWrJb7i2tgHh6zRqERZWAan1u0XMZme7ECkudKUaISvSGVC42RSazDUsyDTI+0/9CqVnqe+pewj8xogm+hMDk7/Rh2xVMFhXhERoHMq2V20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707155882; c=relaxed/simple;
	bh=lWrSbc8jUA99N/jOBUbCzu+w8Kzz0sAL1zOSR3c7zHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=enjekTwNYfOoKa+P6/xfNY/UZOcUuGGuiTebIfN8VN9B1DEmWk9UhsGuuK7e3w6dF7sYBrl9CdSOhvwVY8dSsRiTuL+AMSHdeaKZ1u5hPqWyMFTLj5XBbyo9uQDkfz8/VkTTlOPqpbC1bDicaE7/v8qLceunO+WqpDQ6TAxlKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KI1cgQAn; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KI1cgQAn"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51124e08565so7235636e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Feb 2024 09:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707155878; x=1707760678; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i34tZ3FFPbhGf8aLiNBH7cN2Fd7/KOwTUUwg6OHr+K8=;
        b=KI1cgQAntxY0nzWMIEHKJ7H7dYT5AcQDU3O+d6LCt9HCS4YN79t1yqbuUmXM//nw2d
         XzEvoTGVuWRVcIbst175fHIbvfWbPtx2JZxIK8rlwqoktztsttE8/UEc2s4NtqGrK+iF
         drB8zs0CgwUFwY+AFBlS/LN1iM/++bK2RagJnrKC5DCYRp5WnWJB5YWljXPC4WCmLM9N
         KreVXRUPk83HCiyIaHz3cQiK3dyDLHzUi7C6k0yWR99VL/TgzXDp6O8qf+R9WT4h1mu+
         CIYnM7EOh6gLzgxyrLxZ5Lajzvtk1Hxup/gTK/kVgrf7dZQotnJ6yKOIXr8ACr3HxCft
         iYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707155878; x=1707760678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i34tZ3FFPbhGf8aLiNBH7cN2Fd7/KOwTUUwg6OHr+K8=;
        b=J+dg38eQJDlufEtnQUzBkPfeCa9fVX18tG1b2pQvAoeKqNg3+eDxbgYULvN+w6n87q
         v6PSjSvIRiphPNorHoEP9s4PcuNv9dJu6hpkPJLd8VHCcz6JwN4dcOqnHguODcVMznKd
         b2mK6eys/DiAHbyV9SgnYGAmf6IebAVVZ+jLHiztLv8WlVwJMwolQ/9N6OU6NV0KhUu3
         0Cwq8JwooquA9ei2rsRaIP1J8cJ1Y3fspM4LLemgwhNh4zg/+8Eh+32CjJA5Yf9KNKdF
         Io8AG2sLk9VP5Oq3U4hDxDEo5Zj2uXvnY0H+T31ZV4K9iuAlQ24ZzyIWVfO3Tna3SjWm
         pd1Q==
X-Gm-Message-State: AOJu0YxWzPQUAiT84w5jqYqA453fQC7gwZHTLB/1NDX783ccxZWaR5YK
	lzGdG0aRxw2wgLuxrD+j9buIUjoaagpaoWPdAQByLhSvo14pcfjf
X-Google-Smtp-Source: AGHT+IGoPOkUhCufoS6lCIs5EGArZvJVv922FEUcsxMUGIhQXY+AjR81U8jTSaoj3gJj/4rMS1O5tw==
X-Received: by 2002:a19:6451:0:b0:511:49d9:fedf with SMTP id b17-20020a196451000000b0051149d9fedfmr251422lfj.13.1707155877476;
        Mon, 05 Feb 2024 09:57:57 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXGCK7tf1Ptyz6HmhmmygivSkZttogyHu1TyMDdDQ5Nu8eevB8TjC9ST/lb4I2sK2ORVanShf4tAR8h+88kfXIXB7IedBlO6CdVJTs9VbezYULqUYzMQt5n4PD4A7MsN3Fa6KsCPQMzz9tMOhlKZaFekVgW2wlECNYyCRFLwrInpCrUXkvaHKm4LFzTyVyCbG0d2ApzCkMTk6XK7sYwpllH0iRhxhGVmDxPcrozhyj+VvHLb2WyR1qXuMV+bGFM6firFlILkD9zesHbMrG/b0/FeqSifxG/2UYuX3eqPZyNyY90Z5srLZC9V0BD458p2oUE4snRo9BRj2qVKksVB0/R/+RqIxOaDUlxURN2rmXd4OQFyYsWU2ZL0/bYZjT0GUf9Kk0oJ9UPSfP7o95qiTDOACza5f7mc0cJ0ebko6KKCNkUXGzptbKQ+T92kFH6XPZVVPoUAUj99fRlwAkflkqraPD5kuIcOfX32YJ+mkpFeFoY2DreE6/cfq5hRo/vnZoL8kKsOsixux4ip8p8YeK5cf8afv/p1dRllJ6p9KDBLNdamy7kdAXdrCzXlbZt8dGcPhVkMhh4mBoKnuBkRpw0jX+zV7GRhwtJ53lU9VEle4navhVDjF5Y/rtrNu9e0D9YDMKCccO0bBinK68q2A2Wjw/1070BcyyM2pxBRuh3FTqYMQLcao7vo/yCuCzj9aphfjcEi531FnGXoEdnC0ecyojAG7cIn86l1Jfb3K1Z+eHwE2U10AT7QPWlZHFxrhV90LswemmmJg==
Received: from jernej-laptop.localnet (82-149-13-182.dynamic.telemach.net. [82.149.13.182])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0040fccf7e8easm9068610wmq.36.2024.02.05.09.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 09:57:57 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>
Subject:
 Re: [PATCH v2 4/6] clk: sunxi-ng: a64: Set minimum and maximum rate for
 PLL-MIPI
Date: Mon, 05 Feb 2024 18:57:55 +0100
Message-ID: <1877423.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20240205-pinephone-pll-fixes-v2-4-96a46a2d8c9b@oltmanns.dev>
References:
 <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-4-96a46a2d8c9b@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 05. februar 2024 ob 16:22:27 CET je Frank Oltmanns napisal(a):
> Set the minimum and maximum rate of Allwinner A64's PLL-MIPI according
> to the Allwinner User Manual.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



