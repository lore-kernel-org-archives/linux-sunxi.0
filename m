Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A4E2248B7
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Feb 2025 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739805192; cv=none; b=nd2GqpERlsuxwk7Y2EKSdLZzqj/gv88opA79qanAh9EHZWjqnuYXDFfF99CavCklIhnwQFkPTRjJJcvnUHdnYuF1tQqPmpghq/E854C7hWvLj926b6ayCzx9TIELlEncUAzPx9iakiVKzQEGij4wKcb/EbPQfbSd7/1Aytxs0Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739805192; c=relaxed/simple;
	bh=WqBPs7TXi1TZ+t7BcT1Oc3H2Z/zeW3wGdbgAmH8XYY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WR7EjTfbeWkGeLTkdPMaOaNRzVlzCOYesTY4xHrLjxQi7Ep/iZwLFPXjXrMNVP3Ly5/TnOLP5STOa9JgCq97aUixdbXvECShhR9zCrQIwOoIkKlhxWJJD/VGYIf0rkKNqtEY+0NIzXKD7YtE1Hu8st4rXR41uCgufrXkRoOxaGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-307c13298eeso45966731fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Feb 2025 07:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739805186; x=1740409986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WqBPs7TXi1TZ+t7BcT1Oc3H2Z/zeW3wGdbgAmH8XYY0=;
        b=TgbvbUsnFvBJgtjjenBFdiS9KomDJqrHOUXWJCD3AMM8ecEegM9pcU/SRsFztAimT6
         ApFLbJQoaAAv/JT+kxOJ20vVcspIDxYf7cJrlrEZGOxgJnTol3Bk/qZrtfuwU6hThPkN
         uSji5EklCz1XIVPdYMLDFwn7fsiThdB+ILArmgZboVHmulCIF9e+MLILmlaSwHwlZj6N
         mLp6Dn45jnyvxq0NWzFQ9tvAl19ADxxzdJ0TF5pyrcVBM+Xu69J+R8+0sIfMNGB5Uxc3
         LZVPgTbT2lRSh3ovODX5K0GNV6prcR/NrZN/0dheJHfunt04YFJEtFPuUs2jtGU3ga5Q
         HO+g==
X-Forwarded-Encrypted: i=1; AJvYcCU3D0Y6yUjsIGRHuvuvw5xBK2A/ZOblPhcL/gS/AS+RT+6aWn/tV1kKdIcO41nnRBugluegyTA8BufwFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXb/bslD1NioeK/EOAgOaa2QL9KPmr5m5gz08/D9cg3qVJPXqA
	YPa1n6XD7PqlBIhW4W6GiL7MeQG2bxPI2s0zZAsMe7MAd/uD0MbQzsCKJlUI
X-Gm-Gg: ASbGncsJyyNW8tyuicQlrPhUwmM9AxRPExAgoT/dHSGwiSsuJJpvzun3QoMglyDoM+7
	g2/thKNBQslEzsKzWdC5St8JT4KF7ezOffh8xgfPCJK6U8OXjFF8IOBuG5/LTe4hg9pfssIBhny
	06DDKtGtQ76L466zZYsKyB8tOjedIg051W512lrbmU4nQusDLg6AdsErP3Lu0n/KtCcUMaqbE0H
	36WheMAenm9F8lB0YDGZnr+h7BJQm50AlNujnOh0RaIc/RDoNbf04wgu80ojo6q78W/ZkXsgm8f
	te8DlE0hDOFOlwlECZK5kOyUhm5HnO3qebHzGJJeiDhr0gXS
X-Google-Smtp-Source: AGHT+IF1Uk8nndYc8p5SRLr/zvc0q0U6KIX6oddZgq6JKYilmMA+bMOXNPd4IeaEeg6cMEVqfi44fg==
X-Received: by 2002:a2e:700b:0:b0:309:1ec7:707c with SMTP id 38308e7fff4ca-3091ec771fbmr34741761fa.5.1739805185910;
        Mon, 17 Feb 2025 07:13:05 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309306d5f48sm9097901fa.57.2025.02.17.07.13.05
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 07:13:05 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30920855d5bso31821611fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Feb 2025 07:13:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXxhq/GdQH7UHzdhgUEKVnYhdry/1G+TSmBOOIs0zMhOTuiY1xyPCxySG1i506AkPUIlHgA1gsCNRKncQ==@lists.linux.dev
X-Received: by 2002:a2e:bcc1:0:b0:308:e521:591 with SMTP id
 38308e7fff4ca-30928b55670mr39756701fa.16.1739805185075; Mon, 17 Feb 2025
 07:13:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250214003734.14944-1-andre.przywara@arm.com> <20250214003734.14944-4-andre.przywara@arm.com>
In-Reply-To: <20250214003734.14944-4-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2025 23:12:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v65PNymVgAW5gJzoaAN9bCvbNrUPh=MOGT71wimkGnT8Hg@mail.gmail.com>
X-Gm-Features: AWEUYZkPH3DyqUAjqlsWUrgFVAz25I3j7gx6gVj35UBevzeFHJcZOXdE_CBm2aU
Message-ID: <CAGb2v65PNymVgAW5gJzoaAN9bCvbNrUPh=MOGT71wimkGnT8Hg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] pinctrl: sunxi: move bank K register offset
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 8:40=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner pincontroller register layout used to allow for at least
> 11 banks per controller, any more banks would reside at a second
> controller instance.
> When the per-bank register map size was increased with the D1, it turned
> out that the last bank (port K) of those maximum 11 banks actually would
> not fit anymore in the 512 bytes reserved for the pincontroller registers=
.
> On new SoCs Allwinner thus moved the last bank beyond the existing
> registers, at offset 0x500.
>
> So far SoCs never used more than 9 banks per controller, but the new
> Allwinner A523 actually uses all 11 banks. Since that SoC also uses the
> extended layout, its PortK needs to be programmed at offset 0x500.
>
> Factor out the bank offset calculation into a new function, and handle
> the case for the last bank separately. Since none of the older SoCs ever
> used PortK, we can ignore this case, and just always use offset 0x500
> for the last bank.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
