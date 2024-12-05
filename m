Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388AB3CF58
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Dec 2024 03:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733369380; cv=none; b=EXbUZOZpC2/IDeeNAvK/RgbSlGsrm+eiYjGZKCsAPGYsHrZJL4elSNmcQn7Z0RzxelNTI1jfkJMzO9oPQUZEmAuyl/eNZrj7/8fUMp3sbEWCHWlxykHlhPvwRSEyMtr2rV09IKI8/s5scmdn1tJN/2RLEJhm/Bv925VG3WlhU14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733369380; c=relaxed/simple;
	bh=d9QqhJy6LFx98gqli7amTeV8pMlMivhrXQSOVdmRHCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiQ4WJhzP44GWQG5wHxg1XkYeDK/G1dqFDCPt8livcyRxVoVdoWlshcpJSuNzmzyLUKHCLODHxJNvw3VCkaQPt7mR0uNfM+oJ+6P/T8CSSXGWf2X3PT0kG2BBICj9vQpxfKdQ4pwp5aV5jHj7ho4wdbfhq7ToDCzTDYqY64A+PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3000b64fbe9so3564991fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Dec 2024 19:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733369373; x=1733974173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1k1WfYR2gjydU449wpk5rhPTUc08x8Av6VdOn6ZQfI8=;
        b=JVeyhAGU2X84qqljVEhnvNVjGi0i7NL1zDumVHNs/1VugIpsO6Owk09mkK2XLMJchc
         PqO+0wmZ14zPItUGJZai0LzoMOJKJ1Q0immc9n5eV1qdUq6Yb2iVMbztHijnMkg0rENO
         ulc+qWqe0z2FLmSuJ77ds5qr9nW0WpkV1n+tgo2rvtAhizB0fVTiG54Ikr179hUzw0Sw
         3U9vVGt9D/5YtE72uBRSBPCRWQ2gmt7Tum+s2dcRETxsf78mRtt9DU+axyG9PWlNSspY
         v6Qn4IFUsATNwKuOONgJrOG3b9xG301tScLzwFoDgoOo7VefSU4IJ53HMtAORii40+Rs
         LAtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRof63brFnPydZMbnmFqxkwodVNoqtApLxttZpWFbG4B2C0163ld9YtkqE1NTUpBrYMKie2L4Bj9IjJg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9lzyOtjBXye10lTGyacxgS8h+p90Ki1ZAeKNar6GaFgc7T0fn
	mddbpAM34JV4UeuFdJLN/uoECrJ85DZGDahU/LBjPDECFFnHIiPP33QxDTFW
X-Gm-Gg: ASbGnct13+RX5SSpNgAmS65K4C7LRUoh/ubeyqx8b6uR5ycRUf7tDqEg0cKlopjMjQB
	lW2suHhlsn/X04+z0z4Sxyxp4t8HvPNFeyHC0cyASVnblf0CHE+cck05agfO+cpYQETo3qJb7+/
	0nRK8AVqeiMpVqEGU8QNaghWwCa3RbiPvZ9ccNHA38SMtSywmXHU3p1G/XXU8l3VR4GNYBnACMi
	JtVS02zoYvklAAcmw+o5RYd3ExTd3s6p/aP0qJHWmGzIvx8tBcZMlr83TSPjUMek3dMw4KOGc9J
	54xZf0A=
X-Google-Smtp-Source: AGHT+IHuf2s+Kg8UX1ssdzGdFcGhvflQFUSjyUhPKzTxztaNLhn7rKRHboNUMQxqNw1KqXQOyuVTAA==
X-Received: by 2002:a2e:a584:0:b0:300:193f:dba with SMTP id 38308e7fff4ca-300193f1d0fmr25073751fa.14.1733369373391;
        Wed, 04 Dec 2024 19:29:33 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020d85306sm764951fa.13.2024.12.04.19.29.32
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 19:29:32 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3000b64fbe9so3564681fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Dec 2024 19:29:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEDleaqtVUID/kBla+b2J97T0XeP7jBMrb0/MNrrHTAXzGOgXB4aaU5xHek2HksM3Xpag7Zk8KONQykA==@lists.linux.dev
X-Received: by 2002:a2e:a907:0:b0:300:8ff:d93f with SMTP id
 38308e7fff4ca-30009c50cb0mr52396671fa.22.1733369372603; Wed, 04 Dec 2024
 19:29:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241205000137.187450-1-csokas.bence@prolan.hu>
In-Reply-To: <20241205000137.187450-1-csokas.bence@prolan.hu>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 5 Dec 2024 11:29:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v674BnpmyP6zC85zbCuKVN-gb3MQA=CiQoe7-eV8qqyM+Q@mail.gmail.com>
Message-ID: <CAGb2v674BnpmyP6zC85zbCuKVN-gb3MQA=CiQoe7-eV8qqyM+Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add F1C100s audio support
To: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Mesih Kilinc <mesihkilinc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 8:03=E2=80=AFAM Cs=C3=B3k=C3=A1s, Bence <csokas.benc=
e@prolan.hu> wrote:
>
> Support for Allwinner F1C100s/200s series audio was
> merged in the for-next branches of the DMA and ALSA
> trees, the last step is to add the codec to DT.
> This series was forward-ported/rebased to the best of
> my abilities, on top of Linus' tree as of now:
> commit feffde684ac2 ("Merge tag 'for-6.13-rc1-tag' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/kdave/linux")

There's no real need to resend just the DTS bits, though I appreciate
the effort of making it easier to pick. There should be no difference
due to rebasing, since we didn't have many F1C100s changes.

The DTS bits can only be merged after driver bits have been accepted,
otherwise we would get DT validation errors in -next. After the
notifications yesterday, I started to pick the patches, but it got
late so I hadn't pushed them out yet. Just want you to know that they
haven't been forgotten. :)

BTW, if you merge different patch series and resending, please keep
the highest version number, like you would when resending a single
patch series, and also provide reference links to the originals.
That way we know where it came from and which version it was from.
There have been cases where the latest version was rejected and
an older version was resent.


Thanks
ChenYu

> Mesih Kilinc (3):
>   ARM: dts: suniv: f1c100s: Add support for DMA
>   ARM: dts: suniv: f1c100s: Add support for Audio Codec
>   ARM: dts: suniv: f1c100s: Activate Audio Codec for Lichee Pi Nano
>
>  .../allwinner/suniv-f1c100s-licheepi-nano.dts |  8 +++++++
>  .../arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 24 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> --
> 2.34.1
>
>
