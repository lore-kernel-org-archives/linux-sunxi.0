Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A60221554
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Mar 2025 22:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741730473; cv=none; b=K7egn89TIsMeTtMS1Fdfpx0F4kcXkq+q4VXvgOSkgvu6gP2GJ+pTTHHTGlr/434c0AFuTS0/xf1T0BOPP3SYnr52Xgj2VQtXYgsUle5gueziJZ4bbatdmX5qT8CAsRQUd6UuwLzSyQ5pMpqOIxpC3VrgwosLb0EsekfypnS83bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741730473; c=relaxed/simple;
	bh=R8RuRnxBjgDCbhmHONSNJXWg1vt5oJAuNhFXR4jrKCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pSw2okn0VSMq2rvBwuskeSR/zKRv6p0ePLDRPEEdgb7aKa47uKirzn4Ai57syXiN1F3s2RAIdy5LF37ghoczCemq0OnUsLWqVCx3MlOhEjKHu5NhdxQ9/FgUzIj1P2DkWc4aMZHgQv76b7wDBLQLBDY60F49KrCjYbPNyCGp8Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6q6D34n; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6q6D34n"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3f6eaa017d0so2225364b6e.0
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Mar 2025 15:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741730470; x=1742335270; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hO14LWvT6RF71LJw1vwVk3fu7V5c53lrYh2ZZrrSiK0=;
        b=V6q6D34n4PqwGp/S02BN3O28xp0xNWUsWogF1l4c0uIJF6wlRbCz5zkeFcbAvpZJLe
         qvRAr7flXir+tGxHeum9Wr0JX1zs0ebgi631FgVPMwegA2Gf4NLGT4Zu8wstcNKQxUwn
         vI0mDP5n4IJhut++8EUnXoOJMOB8bmZJ7NMjdSPNF9K3Xe46rTQRIwv7jaJ7bK9txGgi
         SUsW4C5/dz/8Qvm5YR0jj6ZYvIWtHwVHnHCDbb4nPcHum0Kx0G8mmWoLS1rW65+YhKD8
         YPRtFB+DcDVHVf7RGLFfLLh4/YhrM5ZNmWwxBXpf3RS8zDV7rQUbRF48VJ3wLwZ2Cw6m
         oF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741730470; x=1742335270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO14LWvT6RF71LJw1vwVk3fu7V5c53lrYh2ZZrrSiK0=;
        b=cBaBS71uulYCYiSSRg4ACKGLDtsS0xWAK6mjFbu4wyZoCjt499Zfn4To/wRQcTpl2k
         thpBvFlQRJn/NPj/BNVyYQz6WtYjzvn83LLzJgvc3YouPR5sUFGTifhBAQdaR3TnfxAJ
         vVhgPWfyoNqGPgO+0lg6eWfoetNP3O059vvQoC/AGONkdWOgsG+PtJwjhy/ERnYuFLFz
         /j2/qnGFfhv7iDIHzjpZeWbPTuAMF2Tayvh9ZKm4phaiHgEw7FxoweqhnhsEkukMLJUo
         PNHgx/kKaf3DUcC4qUTd24YixjD/zagCxG4de37eP8bAsnxtQxgBDZp1z3HwYoTcKLpD
         FsFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj31dyMzRW4ju3sw9mMwD1h943Ta19aV+pw+xMWwObGP2zZtmtVi+7FjXCPg0ZKJNNaha638QAXqqtEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvRvgoQws+wfcAb6jY2xABzpmKBAaxwZBMjPvbQ3W1i1Naz7g/
	2e/qLw3Quhwkci504k72VQZ8B+7nTiNjI2PxXRpRSeyN/wf1pr+miknUMPJ0cPIrZ1E/NYuEpjB
	jsZAfbpI8yTLJGMuj7eb7t2YBwjs=
X-Gm-Gg: ASbGncu9nIH5xUO+jmX/WEFjGFhGo5KZVnqt2RO1UFEZGFuv6BMDgt2MCPUKveEJ4EW
	e5f75P+IzLwyXYFr76CRlgZixdpc+TO1xblUWgcI5s5IdFY3kFu2ACwupjJsSB2fIAnYqhjj8q9
	mmsk9rwwL/YnmC5Pn/XsOXEpniKbLglSnyZA8nxLJVF5EiQDTL+TU0tRcSfvo=
X-Google-Smtp-Source: AGHT+IEtQtK1Iedlr6fWywHHm6YLJ5pw3KzGPuOa1tPA+iCb0feQo7gMOWkm93j2OOJceBrScIcjgWGvXoXqmEz7oyA=
X-Received: by 2002:a05:6808:148f:b0:3f8:b73b:684a with SMTP id
 5614622812f47-3f8b74ac847mr5214463b6e.33.1741730470244; Tue, 11 Mar 2025
 15:01:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241220120038.3137248-1-pbrobinson@gmail.com>
In-Reply-To: <20241220120038.3137248-1-pbrobinson@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 11 Mar 2025 15:00:44 -0700
X-Gm-Features: AQ5f1JoZh-NGU3L8eIpxDuwcRiYOWZhV0d89f1f2dzKHdizOfdf7E-JnqzsgH1M
Message-ID: <CA+E=qVdbbRbR+57WRPTJ-WPJ2jZz0V=mD56Ts2oQmo-rjxvO_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add support for WiFi/BT header on Pine64 A64
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 4:00=E2=80=AFAM Peter Robinson <pbrobinson@gmail.co=
m> wrote:
>
> Add the BT and WiFi pins on the WiFi/BT header on the Pine64/Sopine
> boards.
>
> Changes in v2:
> - drop patch that enables the WiFi module, it'll move to a overlay later

Any plans to send v3 with comments from Chen-Yu addressed?


> Peter Robinson (2):
>   arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
>   arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
>
>  .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 17 +++++++++++++
>  .../allwinner/sun50i-a64-sopine-baseboard.dts | 24 +++++++++++++++++++
>  2 files changed, 41 insertions(+)
>
> --
> 2.47.1
>
>
