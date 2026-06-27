Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0BE2C11F1
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Jun 2026 13:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782565653; cv=none; b=Mz2HN4C4yv3NXits/a/IShdNZWtNvATvyyal0PBNJxICUMJttqpSLudspL49tC6S6w5sblgMSvoQsQYC1AXUSLypMrhvj8LQ0/IIqUIjZq2mwM5m3+ldWbr2ehNy0tdEagDEWDyc/ega+coLDjVcAsifT38jG4l0+61pmEvBBUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782565653; c=relaxed/simple;
	bh=UmhgP2D8HiKkDS6wrb+BQEzFopfYHIiJqOc6NEvXz0s=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sLYNvMx7G+4YLp+vDpWc2X7uPT+WUR/XR+j/y/WF7/wMOJAqWbUIcSyQ3blaUDV+kU3gCx37mEThcF7p4t5YdfRdCWzdtTmgKajQcMkhKKDgAVG/LpLlIuZSpgVp/EY7jIvVwZdCqy6jbNA7APkdAjMLX+iwqFLGn4MdBBnANFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWUkwM6c; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWUkwM6c"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49270f771c9so3877605e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 27 Jun 2026 06:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782565650; x=1783170450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UmhgP2D8HiKkDS6wrb+BQEzFopfYHIiJqOc6NEvXz0s=;
        b=DWUkwM6c8yiIVyVeap1ZIZ+OR/VO/FSluz/96GhbsEXeoT+7HLBAUAD0Q4jwms5Sno
         UGreO9xkm9gGQeZd7O+kYWvGFpdzqdtyDWgFlKt/gAt5ktoNGg/jeGIw19rY8f1K/61e
         5wKtWDYkHZKKss+SomD8zpCyAEEc1ZdJk02qQrWTalWjp/0ps0T0BDmViOsdhC0yqqIZ
         AouQkrP6NvJOMDfcrmszDVSDDuuOeybkIrqd5WhX7X3V06fFiePaUSKrLeGRtkIf1WIA
         BO0JLnn+779/npE58IJniD4qiirRtSdkgwOWS5xphz4vRTt61aKY/SVL2vjBdouQLoky
         2s0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782565650; x=1783170450;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmhgP2D8HiKkDS6wrb+BQEzFopfYHIiJqOc6NEvXz0s=;
        b=JcHT29yvuSo9RCfiQjM+MHuE4ooBr/Sc0itmvF34GsTLEs6K3Bj8dyh/yDOLbszZZ8
         VPDr5KiPQeQxYpRBenBgdg7cJp+eA34Shb0mLRJU8hVkn7cvq5qfJwzV9vKPPkzLykg3
         E5mD8lXC/rGsCZ3xQTRJa5s9+WKtWFiGx3YF3rfMq0lJCXrYBATIYWB3CB0MW3MYOAmf
         Ao52wQgFVcqb55e5f8Rag5uCJE+AztZHQ5m+UK8M66fRR3ZJoA/xsm562nfvC8dMXzp1
         BFr7l9OMoqeyNryWNEzwCmAVT8e9JzJPXIo+GPdob2K4TiC2+uLMbkXcR2yu8qpxtnAd
         BbSg==
X-Forwarded-Encrypted: i=1; AFNElJ+EAGz3LhrdVnq3o/YvQWA/b0DI26uHNnQML0BQE2kDPBaWpupkXM1XVP+ion8N376IRG1m0OBVE1gpfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHDdiULzt7Ofz8L7pOp30Gni64bmK0w8SkTSL3xjyVPmvNcEth
	eC6QWwCK2V96yR9J6pLaKj1G8FO8FyYtMJOb9rw78Vn2FPuM61ELGoZK
X-Gm-Gg: AfdE7ckGKE94RzQ8TUxQvK8PkLaMG3YWgeaC8cUdFKAW5fSNr+Nqpy/t72ln79q686X
	B80cyycNOpQDhDbOFYqXsTaATm8e6VYcm9RCYBrsecUhAZ2ogDm/mGCZ2Wkm1LsUc5R22xttxjW
	QSSFmzJlrXVONhyJEnB03h6k9cUyJh/iA0giKJL+uN97ONpK8gcyL5LZAa6fWeoT/kH5Gpj2c9n
	p+rilTbZ51z9nLy5Egv+LWEgGL792BOLNW005pubbUKxWDl9G1+N5RVZBGZU9AWnPbtuDi4GXZX
	IMOPMpze70oAbyKBoX+IMCUfmNkasjD6PYqPntUimXSWyYx8ZAqmDD9ZKkEiwC2nCrLFj5OQsMQ
	qWq5h7z1W67brxXvE2MWNLaBeaWPEz+2M63RmJB+rdoK+dKColQzVRs25AEbZWcJyT49FpHGlap
	PgzSXNcnjvT4czxgwXQlvkJrV0kZ4aknvz2xU/R9rgeBUSsZ6ZUiiC6pgKIFHbzpA=
X-Received: by 2002:a05:600c:c4a5:b0:492:2e48:81e6 with SMTP id 5b1f17b1804b1-4926684a6b7mr156129535e9.4.1782565649964;
        Sat, 27 Jun 2026 06:07:29 -0700 (PDT)
Received: from ehlo.thunderbird.net (046125148194.public.t-mobile.at. [46.125.148.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c278ab2sm84360345e9.1.2026.06.27.06.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 06:07:29 -0700 (PDT)
Date: Sat, 27 Jun 2026 15:07:28 +0200
From: Diogo <diogompaissilva@gmail.com>
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>
CC: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Remove dependency on DRM simple helpers
User-Agent: Thunderbird for Android
In-Reply-To: <PMdb9FVETQuPUnyh12NM2Q@gmail.com>
References: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com> <PMdb9FVETQuPUnyh12NM2Q@gmail.com>
Message-ID: <74626A23-5EF8-499C-AF4B-64003BF9F404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey,

I saw the task to open-code the drm_simple_encoder_init in the DRM tasks, =
and thought that sending individual patches for each platform would be the =
easiest=2E
Thomas Zimmermann, is it ok if I do all drivers at once as a patch series?

BR,
Diogo

On 27 June 2026 08:55:04 CEST, "Jernej =C5=A0krabec" <jernej=2Eskrabec@gma=
il=2Ecom> wrote:
>Dne torek, 23=2E junij 2026 ob 22:34:40 Srednjeevropski poletni =C4=8Das =
je Diogo Silva napisal(a):
>> Simple KMS helper are deprecated since they only add an intermediate
>> layer between drivers and the atomic modesetting=2E
>> This patch removes the dependency on drm simple helpers from sun4i
>> DRM drivers=2E
>>=20
>> Signed-off-by: Diogo Silva <diogompaissilva@gmail=2Ecom>
>
>This doesn't look as useful change=2E Is this tree-wide attempt? If so, i=
t
>should be done in one go in one patch series, coordinated with DRM
>maintainers=2E
>
>Best regards,
>Jernej
>
>
