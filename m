Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8021F311C15
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 17:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587780; cv=none; b=OMcxqJ4eJmHNnqYeFgi2fhVvnwrLpG2GP5nbvhzFpJK7UcpDARaNvI0bSQ80z7p57+upod/FN7DCADIAJS7LGvdqdjTaIJ7rPfKvNIgStemOH3t/Zp1sczK8lGBDFOwEqPhLiwSzNxEBsjnUBx2UFyng8cK4v0ulIP7VZVlaE64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587780; c=relaxed/simple;
	bh=yTyXAmu6h8p0aUgPYpkn5R7UxPSmEWLXG8jASemzHPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wjn7iqumMt0+O98l1kLXwu06C+0me1XPtJ7v8b2gP/VxbtGsMB7SPirwWFeLRQKoXYI+TsXJNwhDnhCORWatkfRnL7Gs3ZZBBmJm1KPEkazAoHAEnwLJn+dlzBdwOaFCAJEVCPZ3NiaIsIeCqFkzDZXIDKgypVNKG5iF+rT18/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgWeDSvm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgWeDSvm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4298a028de6so3045641f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761587777; x=1762192577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTyXAmu6h8p0aUgPYpkn5R7UxPSmEWLXG8jASemzHPo=;
        b=BgWeDSvm9F6y5M0b3GyUvSioNd0H/C3O3JAZukhkFPdUxf/xBzNadVKTNPsT74eTAF
         KjnZuwLaw7yljvIW99A6vRvhtd5X1RW0L5y1s5N8NtyDT4qQ/Idd8x/hIPnfAMopPaRx
         ucqKN3W45kOJSpFkqUCSOVWcQrUF2nS3PLM721xO+MT97VgVx2IO+H+H7Q6hxM26eVUk
         KVBYAjmLFr9O/bk9xX4xzXzlxBdn1pHxwOq7gtuxK+/A1MaN1mOEkIAFLvLjl/rl1di8
         iLLK8xfN+Ve3Ys3KVEIGlNln2kAZB/MT9RxIlODwNm+EGTHTN8bwAtbFBYR32KnILRDv
         +AWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761587777; x=1762192577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTyXAmu6h8p0aUgPYpkn5R7UxPSmEWLXG8jASemzHPo=;
        b=ZyuISzqIkvCGujCdBK9b/R568ITInzxbzcm7Fabum7Hmi6USf9GvXE3DzmJRXIRmvf
         pkCUmKn/D5N/vdRivvElQ6Dcqtk2z2gt30KvKqLHXnkBC+FeUYCp8bznGR3nXf2IujW2
         GWZ25MFT3tiy92NG2sd4N76X+uwXTnsRWWhY7eHcKcwdjEXI6NHXjbLcU6x7R+OJaMed
         hBa+S8HkERtnX+lMeR9Y/Qk5bnvoJpbofBORisyCEM1QN8WnHfYUuiJVjHB+pobjg8jD
         fn8ocCR6JHgKZ/41iM9rXQF1hY5Uo3XX9001iTojR5DEkwGGMUZ2K9XVAHCaB6BCadCy
         LVbw==
X-Forwarded-Encrypted: i=1; AJvYcCVyJvU9ltI4UrPOoL+yHTDUP0bQzaVN8klclBCOewFiY5nkOrbEEEJu1UA4R3x/2r20iPiHR5bBHxy22w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyTg9VSlxwfg+piICvPlr7oT1JPTz2NLVmAdhID4Rrh4fCUPWa
	qruh/4iWDC0jFx9C8WGjirLE6RPGCtwQqrKp+yY/+r5FvV49xfd+nM46
X-Gm-Gg: ASbGncuy6hY2Dmhn/nvhU5wnEGUfwqi9WAnPOckuLIWnwA/6bWGqBMG2kxNApEeoj3z
	v+mim23mI80BH5ZWLqOSvJZMsGRBSoJPrKUpLCtFBpyxv/guZ6Apvna0PJ9e2+FjFjQlZAPymhW
	QKaZQideIMQ86QdifP5anmcxCzEgt8R2dWFLBovMq6u0K7WMLUBnuRH20sC4XXxjqtH01P5m1mF
	9kJVB3+viCL9OAP8tzkGO73nF0enU3aFiIhVsnDbM53R87yXzCG7rhzhzVpqjUF7l0As3ZlZYH5
	b57wECAGuM6F4JG5KhvKJ9nNlrm8zc+DoCaALjJHo23dUfjCpDVyLPvJziEmoB4rYWWpLQkFmxi
	8wxyRrf2BF+AWJxKfreHnZdY2bHYndv/zn13xhfrgdUi6xxgzAzDhcTwxUrlVNuaB/g3QzLiDqF
	Cj/44WAvlsRnR+z2JtVZXGlh6bpzZ6YEkPr6+RhRW1jfyaDEO+2I1a3TZwCPD8sZ7DpStdHuOPX
	QKa2g==
X-Google-Smtp-Source: AGHT+IGLlw4i5A56qdLTkfeHx+BuS0U50SIVfjOqfOSi6b+A2jTY4TxAjYbyLaxVW5BAGIINTcSj5A==
X-Received: by 2002:a05:6000:3110:b0:428:56ed:c68e with SMTP id ffacd0b85a97d-429a81b117fmr275475f8f.9.1761587776413;
        Mon, 27 Oct 2025 10:56:16 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475ddad455fsm74789945e9.2.2025.10.27.10.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 10:56:15 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 1/1] bus: sunxi-rsb: Remove redundant pm_runtime_mark_last_busy()
 calls
Date: Mon, 27 Oct 2025 18:56:14 +0100
Message-ID: <12766665.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20251027133359.392984-1-sakari.ailus@linux.intel.com>
References: <20251027133359.392984-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 27. oktober 2025 ob 14:33:59 Srednjeevropski standardni =C4=
=8Das je Sakari Ailus napisal(a):
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


