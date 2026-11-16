Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794808731;
	b=mgcIw0lQdSPXINoDn4inr6TFZdzs3ACxqo2lSyWjvprdiZ/mGmcF9lRHCphXq1nxaZds
	 3lHW8r0NgcAfjNyk+IfbkPIHq1tc9mE0n5mhbYp/Wzy1xFObBMuU4N8y5NOoSkB07u5nm
	 1S0OE6lVkbRSdCacUjONoaBcT+lnNHkCBGjyK7hP6E2MGnOQyut8vXqqg37CVLgp6K0sT
	 GaU7XXDsWF7dBJB8a5plvomAeOrerIeeLAW37KG0BI7aPNLQPRG59dDRPCeQZPtO4mY9C
	 dtiKHk2e/dHcpSh93OgzmYLlEzNSzy755TRkDBw0/M8nsgkCFIia6UdGdqLLiei2/YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HKC6wftTAfwgm7hfDMXB92AtkaDOnYKFMImjf+ok55c=;
	b=rXiSwvL7+UxE4cq6erVkqyzQWvwSmdJh2Nxql5M/vJ7Pn9nwT+1q1HP5B1K5O28DlRkB
	 Sbq509mFvDoYM8Jj6BpDnb85CJ5jhUEV36bTcf3eqdk53PV7teg4kiolJkqw7s/bH3fUD
	 0WpcfVqKm2o6CUuhxzDMoXpuKd+zGOTMQn/JtZPHxKAihEPZwnBbrxIq7SUm7IGASqKSY
	 Ot+0uv8V75ci7XLf3yYBAaTZfmleWeUAsgT8orvmMNuewdOhFizAufFDTyrQchcG1xuun
	 deZepnfHfpwScT0K3i5IDJ9bkLCyiZlNe+MzxybJUdu+MucAlYbofie4++FXGeoKuiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ORQnbZdF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D31606A331
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 05:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D31606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ORQnbZdF
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c14c0503dfso198983e87.3
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 21:58:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794808729; cv=none;
        d=google.com; s=arc-20260327;
        b=VhXQ2L2TvSaK3qdmYxDRrnRI1UP+pxa1t83CqR05lQ9Ys/YWVgzssOfYQVSfwZYyjU
         tlEhVnMuS3kS8LiHWWQoE0wSce2Ulv4IvwXe+tml2XleNVIo+WFlliqEN/27yEJEIBW8
         Mm12p95PQ8Whtv83JBzHKeAo6lY0xCfVXtVtqFtHLOWUdF7j7RCpgZ9c2VhVvykGKND0
         QyWeModTotDnpGSUme2Fd4eBnPJkLSwoDG3BwXheS+BtdfKC8brg7Nb9Ya9vFSNCkaS/
         2nUzbIPVrSNhusJy19eXrYNWjIJgkJ72/BNR4QWjkq5XL5h+lffaVd6+aYPQIvjB/BZX
         yLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HKC6wftTAfwgm7hfDMXB92AtkaDOnYKFMImjf+ok55c=;
        fh=hwgW/ANXllPdMdBmzcoqEcJk8IVtSOCjWgvUYJ9uP7M=;
        b=oKi5qNKXlqBa5m2Ve8wvvxAa5XbSCmdSzfa3g6pmuwvoWCsvny8QepD7GRgs4h8FNE
         gWcCYlbF9B0iM1Lm/FsEdGLGgIJXxFjJH7eW6GDKFRXeMn7E1TcEF0XyV/5EoFdQA504
         mZ9LHsIQN3D+2jsV/uVUW1mny76Vd850D1+33lOy9GpbvXuXckPpmjROlYjt4rP86S8y
         kAu9dcRo4SBstpTFOMcjpA6R3iZeKkMezO0Ul2G2xLV+FFB06MhMCcrCOcgmOsEEFO6k
         xkaZksXCTwCbx9wAbAamQaxFOKTcxjMxixqyss66gWBTgeBy/g4Y0oUA1ZdSYaUgY7+/
         5lRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808729; x=1795413529; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKC6wftTAfwgm7hfDMXB92AtkaDOnYKFMImjf+ok55c=;
        b=ORQnbZdF+Jn2j091NuxlqAmH8paefDPkxN4Sr7R1NF0X1NdcwAnitdRYwGzaOV8I8w
         xbevJd7ZXQYYL8csrHmTMJxn1yKj5CivHb4+x4njlGORGDeJx/hBt8wiKKV1tq1BSprn
         HlKksd9mWi2GyoWxDhaoTwCWur38Hpv5k1jKGBcAqn4seJfgl9o28CasDp30T9DH4Ls8
         LnGDOnP825T7QStUt670A7y9Jt/afVEB+9cgWhZNy1lUz24UfYyiv3IApdS7l5BxfP1Z
         CQ4MrtWrGA5jJMbvEyyt3n8xOF0/ygxrMIaCMpUH1FITg6PZyPqGD9c+3zq1EA//ILRH
         hpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808729; x=1795413529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKC6wftTAfwgm7hfDMXB92AtkaDOnYKFMImjf+ok55c=;
        b=SmIXdN3J0RoXyf1DdvyN9Z8buaQB2sklOf8daicopjvariKgGVEopWoA8NzvHPwT7B
         18edohwNRKR/y1KwDhgru6+sav0nxx8jdHafq1N4uXaCRoIR6pHjhAqvpOZ26JLYgJvM
         FZ4Qn1xnrnu+P7kJLb/4BsRdG8dr8LzAA1PoyqJZiu2sIGT6cXdh6o4ANh91jUakufZJ
         MN98IzxFNTcBAVuty27lGklzzK+jh9cAj8NJ3sFXXz8XhSQ8TVUJ8nY7LMOjXWZ5qXhI
         AZzqcqS32HJB8Nf6CLec/2i+06W454GZtoHqAJvYiLBapvPA0vSzXZSa9/qVoVLQBaDO
         U3PQ==
X-Forwarded-Encrypted: i=1; AL+hErHI2yhkjcPjSB6LQWP4lCW0tGin3C4+EyJzqhlm/Bd882wUWuTDqbpXZ1vqz95kGIJSfVph4KQECxm79A==@lists.linux.dev
X-Gm-Message-State: APuU4Z/pEuhc8utNd9wfrxzDHK9qy8AilvDTPBuUuVilPWlFp6Glhlm+
	v4CoMThen0GjCHvX+MwienvkE6erKkfYJ9nNgyp/xntLNNrylcK8/LVO0g6GJsewgFl5VYWhPgk
	hz1dSX3QoQ2CayXUBnOgg3bPsIJHu8OI=
X-Gm-Gg: AYBFou0ABDP6lIsORSVhNvMuFQY2yYDGaR0Z8i7sToyfVNa9X2W/yY1LhCCc8m5hKJE
	z6QOWVJ9n6oMZw5nYW2/uLSf1iqRTTywKjYMi5yNeUiQEwVwiwVK3J6oR0n7l3UQkILeopXer/2
	lBtAoeZHTluj9ubxrHb55bmqhwx/EbK0WE9NIZLrwL2cQVFicpGuPqVsERwZgMmhoJwx51JlB8g
	4jDAaL/NFtkLakkBPXz/EWGAF3USxVUUcFXQk/ulBUwVfLcFsuDf6WSDgTqzPRWEwJyK1h3SiJw
	N0fvand1+C+JqwZzhD08w2pKkdGfNvZyGs7fTJBoyb2TxfQAlu3bMGYto+tQIOtyiBEWHlYWkdH
	c5oi3AfWVrpCZIzbtP8soA/lwo4RrTpkAHifRb98wDIQ5RvE7I5UD5MDiUK3YEqXarh0ISNg=
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr3973537e87.0.1794808728737; Sun, 15 Nov 2026
 21:58:48 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-spi-sun6i-h616-dual-read-v1-1-59bea5a897d4@gmail.com>
 <179461167656.590303.12402709871115244251.b4-review@b4> <CAEy9hNUgWgO_tzV=3=X82A3kOYBxhukOvqRzaq+-YC18=RZW-A@mail.gmail.com>
In-Reply-To: <CAEy9hNUgWgO_tzV=3=X82A3kOYBxhukOvqRzaq+-YC18=RZW-A@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 15 Nov 2026 21:58:37 -0800
X-Gm-Features: Aa3M54oyNaHJcBkKzqdmGmOePaHsPjod2sYjt6MjOSlPfYgCgkl8Fvj4W_J60DU
Message-ID: <CAEy9hNXFw1Fr81p=27vHR4HbNOA2ni4srU1RyP3W8wxoas6Ztw@mail.gmail.com>
Subject: Re: [PATCH] spi: sun6i: Add dual read support for the H616
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> This new compatible needs a corresponding DT binding update.

You were right and my earlier reply was wrong: the binding limits the
H616 to single-line bus widths, so a dual-read flash node fails the DT
check. v2 adds the binding change as patch 1.

Arun

On Fri, Nov 13, 2026 at 5:13=E2=80=AFPM Arun Iyengar <aiyengar1990@gmail.co=
m> wrote:
>
> > This new compatible needs a corresponding DT binding update.
>
> The binding already has it: allwinner,sun6i-a31-spi.yaml lists
> "allwinner,sun50i-h616-spi" with the "allwinner,sun8i-h3-spi" fallback,
> and sun50i-h616.dtsi uses that pair. The patch only makes the driver
> match the specific compatible before the fallback.
>
> I'll say so in the commit message if a v2 is needed.
>
> Arun
