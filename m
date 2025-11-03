Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D17F3346BC
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Nov 2025 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762181796; cv=none; b=sVmhgiLoMzzTAuJ3S8wxSwh6OUhyvou8NuyweU+9JBUi5UCEGt050+ugrKNwFdcpUMh2wNrDZKZq7FTM9wUa18RV9Tji5/fcPeux6/ApODOidnyWZA76hdQA9ma+5oi2QoTW1nR67mfZhL1glhuDyc3gz2Y0SVm5+faO/Hbh7g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762181796; c=relaxed/simple;
	bh=s5HhCqdsQfAH71nlBy5jT8rmemhezTVFDs0Da9TumsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcDZpoj2hTERMSkBaiescEV2q/YyJ5tyulLFMsumRsKJCYhXSsITsfIncRe8lF7WoauiX8qx40ca7/1JXx2aUDu0DwphxwtQ8prc3RorlDb2lYWKn4j/QtAprmM7bRsTU3INPttehryKIz+lWa8XI9t0ngQEqIB2UFVg5/5LlDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-592f29e273bso3924935e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Nov 2025 06:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762181789; x=1762786589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5HhCqdsQfAH71nlBy5jT8rmemhezTVFDs0Da9TumsU=;
        b=WXcL5D6K092Pd6Vf497MQrHDX099838/FNyKRKp4rkf7m2H7sEmJVGyqdSE4UDtXdH
         B5yY4Z2O1E2QH2ffp+Egn4T/txBkqL/D0QMrQtU/SLSfV3ChGB9y9pdzUO1cA0fa/ErV
         ohSOj4rBRr3p+Ikd/XXjtciWL30jwL7EZ6VtM+gcD3F1nSlgmxz9wKu+ILuXZd2VN1H3
         vwTWE8CiIZHh0QXMybaKluN/grGQ7HucWvHAL8fzaRGraFnsevnvpHigzhvzkD0VDXte
         sq9UeLqZFtWyU9RsYvKwlye/34bBFNujSydoY1fRQabpQOQ7RWR2NxACL6RYZ6lrwE/w
         rP3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbgf4AHnzOeVw+6QWwCKFLNSr6dNhcspLt06k/ydaVF7gPnTNQYE1w64lVz9msJ1aAOUYkHPZE2N5aSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvZYiKyZ/IB/wHdSWkB3o/zrH42MgcaU9RdPq69xKspkvIuGS7
	GYb24Vdw1J5HL8Ko1WHcRR87f4P27dAdIADNsbupxs11laf7yUgMQnShSDXNnGde
X-Gm-Gg: ASbGnct4GH3WWCyXGN73ZSva8lY053Zn5pspw0pqmpPxZ0EUOcXLNZ4tyietpKuGla7
	bA5zH/ks1R2LunVEY1WP+bTmi9e8zQzfXgVQGw/7/Mgc5jAMTUJB/vkmjysgTOZIzbXt9OSN1Aq
	F6PWDwZV7cPWvLVO2y+GyMWND7QmXOXzp1DXOMlQSpi2NTHM4Zl6QKCxsrP2BJUI5XbqPIXRmX1
	On5NhwqR55mwRfLLYHP3XmgRwvOGbGT+ZdEIjbv+/eoahSu3H31acI8A3bb3JmXq5+d0b3CFtY+
	FpHfEzuRmNDPUZMmKjyMqeVKfbtl+mDS6rwFB2AAJw+dpkj8pelLt3SeMTB12F2rrvvOO41imG1
	v0ReW8RO/I6iJNvaRjVq3Qwt6Y1mmvrGvpLBjMcU208kUFbBxEOzgnE57Y5XYA4OgWwIpomHRCX
	YqLDr75CwVxUGBhQfzCUHGQqkrFYovPYSD+ObZo1lcKlw=
X-Google-Smtp-Source: AGHT+IGCe6KnPEhOZofbB7fJy63MunLzWypWJiISCgxfmdofytffcvRWDf/g109rozRVVIfAHwNPsg==
X-Received: by 2002:a05:6512:3089:b0:55b:9796:5d5a with SMTP id 2adb3069b0e04-5941d559b65mr3348832e87.26.1762181788550;
        Mon, 03 Nov 2025 06:56:28 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f38d570sm2892073e87.19.2025.11.03.06.56.27
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 06:56:27 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-376466f1280so57013391fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Nov 2025 06:56:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfrNk/nzvZVX8UGyBsLRYnAvt5fFky85Z2/0lj1HoWVDL905SB+qtQddjTLGeo5NL/ytLefQFiHnCj+A==@lists.linux.dev
X-Received: by 2002:a2e:8317:0:b0:375:fa47:14a8 with SMTP id
 38308e7fff4ca-37a18dc644fmr33438281fa.31.1762181787126; Mon, 03 Nov 2025
 06:56:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-22-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-22-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 3 Nov 2025 22:56:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Sfk7WvEXNnRfKRehtyn-4KhPBER9tV0E2_pX4JxGC8g@mail.gmail.com>
X-Gm-Features: AWmQ_bmDRSdirXrFZY61Rit-O4eYxqlNFv0KMpQajaon1izsKkp3c6YIV8hGfRk
Message-ID: <CAGb2v64Sfk7WvEXNnRfKRehtyn-4KhPBER9tV0E2_pX4JxGC8g@mail.gmail.com>
Subject: Re: [PATCH 21/30] drm/sun4i: csc: use layer arg instead of mixer
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Layer will be more universal, due to DE33 support.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
