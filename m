Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EBD1EF1D
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Jun 2025 19:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792573; cv=none; b=nScAMumO4tgUG6cOU5gmTppfiGpCEmoKQdGkTfwHB2ZzXRF8Gyg9Jbdcby/1kKmwIwY4XKSlKMhz/ryFEvK/w45zLvC53f8h/31Pui3t+KZJjD0g1Sxc+loxOA3geyoWMPVCZrQo40o0hvw98f8i7x3PvnLzdGs2+gYDvtGA5Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792573; c=relaxed/simple;
	bh=ihWWakMukXt8Os5zOHseSTg4tzKTY1m9zw8OxkJuiHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9K7aq1IeOnh6TXo0Bu0Sc0UWQMS3SorgD1XDI3j0tOYV9iOgGTxwgjTjDQPUj/xyIq7sLN2pLDRuRqItEX5YoYXKJsPLT5iiCyuHIcf0xGQe8rcrxNXtDTGKR9xmZ+A2aOs92CEONRxwvAPa+i/PJx2WUJIBZei1Nv/KqU/LzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C3AWqq8+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C3AWqq8+"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so778232e87.0
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Jun 2025 12:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792570; x=1751397370; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihWWakMukXt8Os5zOHseSTg4tzKTY1m9zw8OxkJuiHM=;
        b=C3AWqq8+3ksaxJ53WqWQP3YOaF6ayJ4ZAs+WgRAB538NPnldMupiW7oHmlZD3tvmgw
         ReAz/HGL7vqSTQe9d8yGlwcEj6ovZr6aEMdFxlotnQGcoH7DgOsWFn1hXBAbIXT5qndC
         PfrxfMmSCXzIRsHy0vSYvQgwpaGcFoUJzlXULcCwuxURp9qxVAkT/txBxHAHsN6UkP4H
         R/Y962OKzuUFKmq1w+sD+0q2/i6rfrDC3g9mC/enEkX1h+IFoAC87AaIEVEJ+ZfIoW2W
         NsAP+1qgowmtA7R3xx3Tc+itBSLIbSxJbKFZgaxJvBC3VUFAd46txfCf8DaWGa4BREau
         W95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792570; x=1751397370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihWWakMukXt8Os5zOHseSTg4tzKTY1m9zw8OxkJuiHM=;
        b=RhhUEofCNuVazYjSEgKgdOD1Jl9h4E+IL8Rq/hlRDSpzH6xTRQKvbdpHrx/xn1hHqO
         lDFbwHm1zJ7H3FpnV2F5Agqm9XgrLE4n7Zf+05psZlp5kXrOk2uvWttsa/LQK59A7q5Y
         R541G7j6Tj0TpMySP1aEYI0mAWz/IBf8k7ZLqJsidEWLfmwGWfRZEhWbDzHl20WGqbQV
         A/dPGM9b2PueoD/nqLtqiwJ23RW4ZGQvbzJNI5CcV+tgTFD+nAnyPRMP66H9faVb8u+m
         cP8OMKVO2YDkDZVZdrzph/Oi90bD1jFNwMGU/iHANlVgE+PlGYc/PZln/SbaP3x/Y2rS
         HgEw==
X-Forwarded-Encrypted: i=1; AJvYcCWOmDpwUzbXIAxNTHEbszi1OVUjupCvdazPUh1YSZeg4T25GV5e78KD86COFXBXxExMi22/+sl43ZiI8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YypCO0YN5Fn2QTXK/IqGCBkAZcLg4w/GtEIiSldhM8t3cadPSf3
	bwkm760DZaWzMvi5P+X6s6faMeVNTud03PR076vBFP+YiszTIPmWhieFsyvfhwDYalWuygmeOSN
	1Lv78WnTYBSZK+yTtVn9P+ogFedtfb+rQyFmEQvNcnQ==
X-Gm-Gg: ASbGnctZR1IW/EuVxh5tJoojBzMw1WBuYDo3Oz+4B8iAXfKHL27pkRql/nYxJkKfFg9
	H84vrwoIBs+0zTmWIhuU5NfvvX+FmbLUfQQ4EsM+gW7vKnHMJ4YR2eDT2t440eZk1FpMDz5WEJI
	RQw1UPzVfTSH7G8xJpuMFP/lz+hMR5HY2ZeFICUHU4wuk=
X-Google-Smtp-Source: AGHT+IHmRRS+snn9ezdisZXjq9pNKvNF1NOIie7MqflwaPNY3SKz61GchJJ41LtKpgJIpimyXyrJyvJ1Pacxv1Ru12U=
X-Received: by 2002:ac2:4c45:0:b0:552:1c1b:561 with SMTP id
 2adb3069b0e04-554fdd23ba8mr18893e87.23.1750792570121; Tue, 24 Jun 2025
 12:16:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250620010345.11247-1-chenyuan_fl@163.com> <20250620012708.16709-1-chenyuan_fl@163.com>
In-Reply-To: <20250620012708.16709-1-chenyuan_fl@163.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:15:58 +0200
X-Gm-Features: AX0GCFs0q4vtQFV_NNK7FgYpbrOMY93VLrNBvqqOTi5xPuc96sQtOMY9VoZarF0
Message-ID: <CACRpkdaA8UQYX8bFeHn4JCxLgK_-UxR_n=ZCZmgbk8tqSgnFAw@mail.gmail.com>
Subject: Re: [PATH v2] pinctrl: sunxi: Fix memory leak on krealloc failure in sunxi_pctrl_dt_node_to_map
To: Yuan Chen <chenyuan_fl@163.com>
Cc: wens@csie.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yuan Chen <chenyuan@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:27=E2=80=AFAM Yuan Chen <chenyuan_fl@163.com> wro=
te:

> From: Yuan Chen <chenyuan@kylinos.cn>
>
> In sunxi_pctrl_dt_node_to_map(), when krealloc() fails to resize the pinc=
trl_map
> array, the function returns -ENOMEM directly without freeing the previous=
ly
> allocated *map buffer. This results in a memory leak of the original kmal=
loc_array
> allocation.
>
> Fixes: e11dee2e98f8 ("pinctrl: sunxi: Deal with configless pins")
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>

Patch applied for fixes!

Yours,
Linus Walleij
