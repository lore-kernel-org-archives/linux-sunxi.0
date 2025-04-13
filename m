Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABCF2D052
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Apr 2025 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744556066; cv=none; b=NzM0ojC/PzuhpkEppePAV2lMwqNn6jRrboJv3iALf0/kksHsVmiVYyqLCaosl57m7WXl8ifNeIMAcUyQBsTGK3FfC4jjSjDOGiEmBgK70iE1w2Lm5sTqCKV+HQWdy34JFKOyziDZRSxnw5p8G6+lAHrrLcQoQcq18INZd/r7TTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744556066; c=relaxed/simple;
	bh=dvelPXkUdIwCAdAldSQ4W7PyCYIe7eFMCwQTwWTrGcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e0q87zgm97D48RZ0/jLx9DUoSlnqgr+cP4sIx0D661ZCuOMPA9zouCQDmmu/PIkOPnR0RsBkyn5QRww50wdeK33xDnjaYMgD6xzkRUrKsepfAsFuSedRPA9b5WUNs1GFpiVI/s4WoacZ8a/V6BFJfHEzafEUrLvyYLMCl17Twfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4JD4ekS; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4JD4ekS"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso6093066a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Apr 2025 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744556063; x=1745160863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvelPXkUdIwCAdAldSQ4W7PyCYIe7eFMCwQTwWTrGcA=;
        b=i4JD4ekSvxejdqFgzb6P3/u8Tq++4KY8eNh81ryWnIZfrfEyw5ApBYp1zhOaiNbQ5N
         Jjo7abfc2Ou3kTC7OC+A/ygHorn360fSEqDmensSwqzsntLmj/cBn5BVxKrpjyocQPt7
         XUXBXviD6UXQxj5S0y4FLOE08FXnZJoHUAxeZRwdnBoSMvlTheU7h3CAn4CE7qsjcaYW
         ducf70EyZ5c+3l8wqRgmHoMCBFmgKpV+hUKCLGdpMj0yote0tFVUGNRqxkcgpXQ1udYF
         XEMk7cfKEN4AkK2SyZh31CW6f38fcSFk1UJVW0Q3c70sTx6EmdF2NmMKQZkrsN7g0NTj
         Rx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744556063; x=1745160863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvelPXkUdIwCAdAldSQ4W7PyCYIe7eFMCwQTwWTrGcA=;
        b=LAQDRn7Aj5Q2+ry1D4yvFiZ8TrVnWIvjmq4YWgNbIO+g8NZ6iicwGvLwlUHFFY2dMN
         Gr4QP+PJuUmSvSAwsYe4fCruPTuSyXtI/eYqsWmiWTx+w0gRmY3THC40SUJMqS8xipq/
         3MtDxEmy5idfrBq61LW04yDL9S1MkarOeQ1Zvz3ptXAfbwBBkbSZ1ilijX9EYqtPioua
         Q3ilqGlSTA6TWiKw9xMSdPMZX23g6HU4XIJc80BruRSLDIV1nTf76GEPguMmhQMTBl8s
         PAVpVc7K3plCRVh+dU2Z0DpgLl4qT5u9nLROxvhqE1FHWe6C3yfwnk2rQVWQv5jzbmei
         m4UA==
X-Forwarded-Encrypted: i=1; AJvYcCWcwE91VXiIud4wgF/QRfzQoMQXsdKkG8bIKUTcHU03o+3EV1pLz9EmSQA84NKZw6PSaPNEZcEeNMdNIg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy76zNA1Wrhasj3jxtJLQu/K5RDUH+k0TrFJZsB+I1s8CKWfGnr
	Lw7FsEKsTSSgjtST0kRQYpfBxjE1p9VqMJE0EWxBRlnHEqInHk6F
X-Gm-Gg: ASbGncuKWPIr9zlT2MDbryo6tNKhVVrJk/mvaFaAT9Y0aJmvVS28X0zUPXZRqK2Rzqe
	MOVMlxHlXKQEHisk6tY9G1NiNtVSOAegN1so7AvlN659toC0Ugd7AO3GTiwuLiFHZqiu0EzPfaK
	jGfwMrZxylddImEdHIl7ST7X/X702KjNu2n6XRLDuhYIz4Tz+iijjA7DCWNGOt53aYk47gSoWOF
	5lEvanIPclhMi1LQyU0GrygdLfoDXxoR7pBdpKZTDwBEc9LsfDsHY6PLEklJev1HOp6ENBhdTEF
	6Eka+e3+OXf3butANDyzUJ8mgXQyr3uVLl3rCZrAe0bbj5W8pYL73XxbtLM=
X-Google-Smtp-Source: AGHT+IFgqGhavNUgVnAURGWH2ePtNWVyQ3zUa0nRZiYGvzy8qKrKzUY1RZR3SZ91BcXNuvYs1xz9TQ==
X-Received: by 2002:a17:907:1c07:b0:ac3:3f11:b49d with SMTP id a640c23a62f3a-acad31f535amr897088366b.0.1744556062628;
        Sun, 13 Apr 2025 07:54:22 -0700 (PDT)
Received: from jernej-laptop.localnet ([80.90.89.143])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1999d96sm741027466b.0.2025.04.13.07.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 07:54:22 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Mans Rullgard <mans@mansr.com>
Cc: Pan Nan <pannan@allwinnertech.com>, Maxime Ripard <mripard@kernel.org>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: sun4i: add support for GPIO chip select lines
Date: Sun, 13 Apr 2025 16:54:18 +0200
Message-ID: <12643311.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20250410115303.5150-1-mans@mansr.com>
References: <20250410115303.5150-1-mans@mansr.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 10. april 2025 ob 13:53:03 Srednjeevropski poletni =C4=8D=
as je Mans Rullgard napisal(a):
> Set use_gpio_descriptors to true so that GPIOs can be used for chip
> select in accordance with the DT binding.
>=20
> Signed-off-by: Mans Rullgard <mans@mansr.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


