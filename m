Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4002BD04
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Apr 2025 03:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745811850; cv=none; b=gbLaf7Q3OXeHkUWV2ihQVUBmAr9hVUGriPB8NIZg3l5bozsVFsxWcwemqQO4sr984qsjlQnvAm1XdkUjr2J+cq8W0woYwSTTFC5BfOnfRK4MKz//YkJg2eQOHwtV/XcO5HrPGPbOt3ub49FngtzOyPzhFgjwCSYpXMM0LgmE9Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745811850; c=relaxed/simple;
	bh=7CAC38e00t9BNrxBO8THArYyzt9u+eyO7blKiSuqsOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsmLcVPCXw7j0qIUuFL/0EifEOA1s1+GdLbGr+dQzW5+0iX8aTpWTEAYeQOnpGiqBrvXjAATumV2n65nztbNS025V0J/z0LnLE0C4Mf0OEpferQGXBJzemZ1KTFkm0agZz9/EKknlYPls8mC0ibfTPncgOCpcAr/xKuJfo2T52k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so5040463e87.2
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 20:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745811841; x=1746416641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7CAC38e00t9BNrxBO8THArYyzt9u+eyO7blKiSuqsOg=;
        b=q8gCYPQOushIFQK40PEp3+XlwNsVtWLbzYp5o+zMtnyCAibyVFTYO6FBqoNr/uWzt/
         pOiYuTbHWDxjb0eEg7whmNBZCCYEHBFOxU++v91wJ9B1cJ26jRWXWmnoqaa0vm3g2gJp
         kJ3iPCc+6j/6Jr68E9x2Rzlp3EUWT+reu8uvDsnISuqqmfHLNYCWW72IkuShfpq5ET55
         pqxMpH63UoYOcA+7WJVjyGmsRrZnhWMIZtkhJ3yoh0y+b9G47nNnqmNnHc1vKdNgjYXz
         thqicR+VepsFUgYDJ/JQIt3tk12s+3Jch/VKwVpJ9DvxBCqnTACZ+7Dies7FDncw7Tbi
         Quog==
X-Forwarded-Encrypted: i=1; AJvYcCWnP0oQ3yxrDvzHjFUWErTMHy6mb/o2b9xFSgqNk0phQQlYntO8Sys/kCA+jzj/sYJNZkBZL8HuR7m7Fw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwT0FaGs5leGeRVn/0cHWWwuidfvdhRd/Bvxm+4qujl/eLpOeS/
	8ZzxCVSg5B2SU0yociIjfMGv5k4xpAStfSkta+RjGCOAM4hja7FYw1HfY9nFMTY=
X-Gm-Gg: ASbGncsw39JXmsgxQSRtnnNppDqS6ujiymsFF6WQIr0pB5Gmm1WyfwdixUhlCi7WIO1
	jTN1iDbHyRLTYVm4+X4lR0kmUVM5YIt6vJC59rHkhh4KIksACthz6CJcHnIxuBdgIV2Y0n2cubU
	KNRYys/bHPeyogxV9bsvgZrMKOurVwhujccAb1eEHPz0v7TjhE3v2HAtJZtezohpvN2ZbI/DzzO
	vXAzrDS2ry6buODWZHqzEQV1nKnzdw8dI1OHY0QNcIp3o13IY2fL82yfVNU1Dw+sHuxbEUSFNDr
	nm9GKzYQPg9KYhrCgqtjaobpqKhMC97yeGJ9KMwId2l1SxIvx5U7Jy5gg7JTOgefYxieLlS/VDi
	liCgJqkAv
X-Google-Smtp-Source: AGHT+IEa4rpX9IUzfKUtdHOn7Ss+5bNTzUBlxsLnoHg6PIbjQf2DqVKnbuYVP2iwQ3lS91QIz0yHMQ==
X-Received: by 2002:a05:6512:3dab:b0:54e:93cf:338d with SMTP id 2adb3069b0e04-54e93cf3569mr1783962e87.12.1745811841043;
        Sun, 27 Apr 2025 20:44:01 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3a81dsm1534140e87.89.2025.04.27.20.44.00
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 20:44:00 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30c461a45f8so41412091fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 20:44:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqtxpqiKYij3EnuIGd8mjrMwOMHxpvAeaNpdomBV+NS+0AJwWA5ZQfsPUVvZd82CZXUUTyZHRTxxS2tw==@lists.linux.dev
X-Received: by 2002:a05:651c:54f:b0:30d:62c1:3c0a with SMTP id
 38308e7fff4ca-31907612579mr39451231fa.25.1745811840373; Sun, 27 Apr 2025
 20:44:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGb2v67=aENryhsQ6VBPwPXskMvMDZpzzeHz2LTUt-VDMTyzGQ@mail.gmail.com>
 <20250428030015.20915-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250428030015.20915-1-amadeus@jmu.edu.cn>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Apr 2025 11:43:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v65EP7dxOe_dcuF6hY+nU1GdO5gLLEtny_yCiOT7LbHbkA@mail.gmail.com>
X-Gm-Features: ATxdqUF6GOIa9pZuDBxWtkqX4m1trSs8x7Y-JZiW0r6eRTpffkJIo7zf_mFd4yc
Message-ID: <CAGb2v65EP7dxOe_dcuF6hY+nU1GdO5gLLEtny_yCiOT7LbHbkA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a523: fix SD card detect pull resistor
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andre.przywara@arm.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	robh@kernel.org, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 11:00=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> wr=
ote:
>
> Hi,
>
> > Fixes separated and squashed into the original patches.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/commit/?h=
=3Dsunxi/dt-for-6.16&id=3Ddd97ddc4da0af02139b0e97e98c210219631e161
>
> In the above commit, dts was renamed but Makefile was not changed.
>
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-a527-radxa-a5e.dtb
>
> Do you want a patch or will you rebase again?

Fixed now, though today's linux-next might be broken. Sorry for the mess.

ChenYu
