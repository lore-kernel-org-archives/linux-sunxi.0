Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2870341645
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665857; cv=none; b=Y57kjcg6+S8V4aqLDPyX4advGGjUogsEKsfCIk0Q73jK9mC9xFtY6Gcna02l2iWswUUtNJh/0iL1BPIt3aQsuP8PPhfQkGDrneIgBzrgjs3obenqzMLu3IRRjyHN37+jPztzpCfxFLgZBJCDk6or3oqHlmN3RePeA6BzCf4F/ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665857; c=relaxed/simple;
	bh=Tq1rindzPoSv1LaOddPS8k5NKUTrYDUpuyisQ7twQKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=An2gTNpfA8XB5hXHWwOJjlRbZcpmkm2ufgobxMF06Xq0BmQhRoSL31Zr4U1woXKOCHh2avLpg6c9/5rSQ1YAeqEhQPdg0Shhe5W5kbG5Dz/oAxaQTgn5CBWQ7kPWr9/vP+jv/3LaDUVIIdMxIdm59J+R3YwCJX51CXmi4E57E1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAGZ6/XM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAGZ6/XM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so36780005e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 08:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761665854; x=1762270654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq1rindzPoSv1LaOddPS8k5NKUTrYDUpuyisQ7twQKY=;
        b=HAGZ6/XMRjHjDLEz8NLGvbMmwy0isbp92KWJqEZtJGetpCTe2DXL9v+ymBNFVBVrMf
         n2SzXQrA7/4nzuPr/wro17TpmiEke5v+HDJOq89zFplnlLPq23TkC6//4zW1+p0XrMFp
         5ciieJ5iUIcGzxfN2yH+pl6hBzwhMlp5Gy7KMB2Hd0XGH4yVqLID8Bj2L2ngaP9h6FYR
         2YA1zvHp0Rww556wTjUZl83d5MPdXHQ2oe77OVT0EbcIv1ffNemyzM3H6TAG6vS27fmi
         EchREMaX9O3foiU6xtJXp3iz+jGWumIpz46+m8xrz4z4ToQqh4IFEKNTA4ZSOy0JZil1
         48Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665854; x=1762270654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tq1rindzPoSv1LaOddPS8k5NKUTrYDUpuyisQ7twQKY=;
        b=ZATwNAhyLi6NUXpQ9HvdWdK3yPR+dQCJXoUDzVs9PnZXHqopVylpeoROaqk67CgbwG
         qc5PV/ZCKkJQS5+ulw6J5QxfQon+HwC+s/tmHjO12ALzAN/49lhRTM+BO2GL85pE68b+
         ZZdDJlunppniioMcuaogT3SEcAjbDjW0glaiRhFRmFaxDEay8IiMeMaOOTux3qJ9xR+6
         8UjDUXDZu/e3xGqZMNxIZQERqjHh+lYDQk8jjtFR0nhttavCnaGg1NEX9L0QBhVFWIH2
         zmRDGJVWihDzNHJyhoNyq+32vYQ9g976XEZScOpd8aYVJ+2Ae91GLHhvGachHXO3gEXS
         rGsw==
X-Forwarded-Encrypted: i=1; AJvYcCWCWIl3LG6Scnbk4PNFnklLwEuuLeC7dsBrdtjSlk0BHILspXztN/Ph44rxYU0G/PUWbrsTNbC4I6Kk4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzWBj2VRq4nxCZf5892tE/RzS/l1m8M65s3ofFRtuQxgJfw96k
	CfYuZ3JYTup2fLKC7mGsabYps2o2ULSqGW5A7hNiAl5S9qESAPF1+qgC
X-Gm-Gg: ASbGncsok5+z6Y/DRA4vty+yZ5yydFntrAlLkT8tKZe8lZ1UHceJvi0371b8UBcCm6X
	b+niyH+or0s2+BJXdxVFBrwCyQr4V7hw8nNT6zMvACkAnEBEnfa5MbDfc71CQPoC/Yws/R00ZAW
	1OMeBWAOjxe5tC+ELOgoaJQARYC+rFhScLNV+CZ7V1BEf15ICoK0JfcRuqZOVj8NgCFlR9YaX/E
	sQSWoNsPsJr0Q7+Wdn1FU8iRoGYlhHocdSIi0U9Kzg0g+f+S3VxgGVsZY71oioQMBcQdvckxzA1
	xH3I6bke/VSSwFQUMFyJEQ1MQXGtbjcuX/IeO/sZO1js672VlbAGngEuMMEqQO8G6wGTJIA++F/
	sVFW4DqDpnSb2yljIBw/nMZjkuE8kqYnT1tcWkAJvRoQ18A9nW0sZwLk2k67o/42bHf4r4dHaSf
	ob47Fqb0s5L/eTEpauhiu5JmuPN/m21V1Mux4M+lpIpS39yKK/AgeJ53Ou2g==
X-Google-Smtp-Source: AGHT+IHXOTFO2WAIn1ZujBJa9U0PAXYA4glOCwdtcmQllsrumq7MYqoGH/iY7FhfpKKBj/R4vTdKSg==
X-Received: by 2002:a05:600c:848e:b0:476:84e9:b55d with SMTP id 5b1f17b1804b1-47717deef5dmr32584225e9.3.1761665853339;
        Tue, 28 Oct 2025 08:37:33 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9d1sm20581519f8f.35.2025.10.28.08.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:37:33 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject:
 Re: [PATCH v4 06/16] mtd: rawnand: sunxi: introduce reg_user_data in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:37:31 +0100
Message-ID: <3656445.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20251028073534.526992-7-richard.genoud@bootlin.com>
References:
 <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-7-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 28. oktober 2025 ob 08:34:59 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The H6/H616 USER_DATA register is not at the same offset as the
> A10/A23 one, so move its offset into sunxi_nfc_caps
>=20
> No functional change.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


