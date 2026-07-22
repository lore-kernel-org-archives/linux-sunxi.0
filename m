Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2295F3469E7
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784732500; cv=none; b=rBONMKASAE8xwFHLp56CxpkmvMyVH2j7UXSWKoQ34hvzXQS9xWECdlDoCxXie7T/+kw+0YbWKVdlziGhlxKbgXphmAc9+HuM3VF7OQFVJA8GAFWF9BReCUAnIhbenop9NTxWQ3geyFYlovkB18bbX1sT7O4PSToMTk0vbl6rbP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784732500; c=relaxed/simple;
	bh=WydfffUHWptX4pts2onRItArrjytsjBHfV3roEdjhQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jHES8RZ7/RwsLe4olwLTtKv9pzidTvZgQy2WT6hqBK1NH2SvYaaxBht/nFby3BiWFPF4dYDpJw/UcDCJO0sC+hImr7U6yiHyAL5cd+k9LAffuGSE7Z6WNBxlp0grIjZbzStsPqoFIOYPHAP0tHfqZGaid067W3jWLc1Vz6J6N20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXGkSWKh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXGkSWKh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b966dd74so56430315e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784732497; x=1785337297; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WydfffUHWptX4pts2onRItArrjytsjBHfV3roEdjhQQ=;
        b=UXGkSWKhpWbMkbNwDBckVwm3EFA4a19dPlFpFXKD0NO1PF+xbVt3NFE6ynGulgB8Uy
         T/Bm2QipyIMBtjV89dcuoYPqZrKWfgTkmRN41ItLyoHF7MwomOKSlDy8PSNCuOy8r40u
         yU7tbV14PNv1nGJgzCoSSlejZzNVnpL5F2gkFMMW+pHWkKbgri6krKrLnKGtv6c6sIsr
         QhB036AbydcTFkpLYDTYmX4QldJuXGPGCLE+DtuvhSAS+3HoEM6omqbp7Vexvs6cPUPZ
         z6GqBHBohfk9K0IzZ3301hvYBh/QqidL3r1hjj6LSYZ+XB2P9N1rgXnn3hFeG/72MHzw
         PXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784732497; x=1785337297;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WydfffUHWptX4pts2onRItArrjytsjBHfV3roEdjhQQ=;
        b=G35hii7WWkNoY0asFAbbcWck/r/WilOsMGohKi++aYsnddZtBJggFI6w+HopjGzKcJ
         JDoGR+95Nliils1/2/39bLXfIkaBgRI9HoqVUbpTdiSM5IPp7hVwvzltQRIweP4ApcxV
         BiMSl290Lt3HYFXLpK9ubFcALXfhMF4ydf4Ae9LoEpLFGsvTRA55WTFfmnBuhMn2B5NN
         joX1hDmKbm++6F2DK9rN+fC79c8mpFmKtkCE4LY/1Z5bJsx58IomuDDNQivzdQUdi7v4
         bgqQhkKwfjEd2ijTUjkQSQApes7wLDZ/qnjqdbL70ch349DIhp2+WgcbSKaKAiReGwbU
         kRBg==
X-Forwarded-Encrypted: i=1; AHgh+RrHsYHlbnqP8i6+E1hGXJ9wBr54aJM0wwf+tSiwIJQla+Nu+wnWTB/PM1IKj22ydN11kUUQ4IRnsOAABw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjyJ86/DVB96eeQ/3OIYqoJwIRkFMUC24XHMa/k+HjCybEM3jV
	Nl4SlKk84uI8+dphTHAGjoW0oEnAdYq+/5a/UkNGmZPtlbIcNYzBQtkzr3/weTR/2Tw=
X-Gm-Gg: AR+sD12oN95RQ0RSm4vPsNs9RtIq2XqHQuL3S3eL1przIYR9xCTvIAguaeEQwrk2079
	nCj7UAEVfcNJI2m6hKTBbfYvMGCcYFQobPgQA3YMZxDOOZ6uRU0DZ2cvX6TrVpGVhdGMcyKGOHl
	t57gvozFR4GSrlIVPpKu6miTFkR3vQ8dH+CBfmEiUdmOl9spNBurlYpN5aLDyDYhZju3DGqZICi
	ndZwX5QWZMgJHi7AJkuOIgd+Vj6ASgALcxMu441ITyVF9b4MOwa1SkQ41LSRCdvM/Xi5xcTFLlT
	FYnhuNa2tVlf6EYoTpjE0CoT80CZ/twQuNff3vUvQ3jY2llUg0JcGIWpiG885zcrl/ftwwibF78
	WEQblP/Q9LzbD9LqOb+bT7QaQGh+JsgHT2oiAQgjB4DCWHak+YFX8193LVbsEvQfIvrwL9qLVe7
	F+4yvOW5ijxXTFQ/FosBi2ggf8FKxA5cfJg5nGZtpmeuRATRo=
X-Received: by 2002:a05:600c:820f:b0:495:52fc:e235 with SMTP id 5b1f17b1804b1-495532489eamr220852285e9.15.1784732496901;
        Wed, 22 Jul 2026 08:01:36 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bfed7sm166033475e9.11.2026.07.22.08.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:01:35 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: andre.przywara@arm.com
Cc: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: =?UTF-8?q?Re=3A=20Orange=20Pi=204A=20=28T527/A523=29=20mainline=20bring-up=20on=206=2E18=2E38=20=E2=80=94=20patch=20series=20for=20review?=
Date: Wed, 22 Jul 2026 17:00:36 +0200
Message-ID: <20260722150047.2394295-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721001012.7bd0eb1a@ryzen.lan>
References: <CA+c=wxW6t+dSgTOpmOoE=PHisV-fSCfFWtJdhxeNAvm-LX6eSg@mail.gmail.com> <CA+c=wxX_iv4QtTQNBYYD1Ptmyp_vPgTazG05F-6bsZy0uoivHw@mail.gmail.com> <20260721001012.7bd0eb1a@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

thanks for the detailed review — all of it is useful.

These are the first patches I have ever sent to a kernel list, so most
of what you point out is simply me not knowing the process. Sorry for
the noise, and thanks for explaining it instead of ignoring it.

Since that announcement I already started splitting things up: the
ccu_div set_rate_and_parent fix went on its own (Reviewed-by from
Chen-Yu), followed by a 4-patch A523 GPU clock series. Both on clk-next
— 6.18 is only the tree for the images I hand to users.

> There are already THS patches on the list. Please have a look at them,

Will do — I have the board, so I'll test that series on hardware and
reply there instead of sending anything competing.

Next from me: the RESET_GPIO / mmc-pwrseq-simple issue (breaks SDIO WiFi
on any sunxi board with #gpio-cells=3). Display waits for the H616 DE.

Joining #linux-sunxi on OFTC.

Thanks,
Juan Manuel
