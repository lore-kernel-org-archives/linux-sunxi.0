Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A521B14F62
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Oct 2023 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYjf7Rka"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo4587262a12.3
        for <linux-sunxi@lists.linux.dev>; Sat, 28 Oct 2023 03:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698489011; x=1699093811; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mg4LJQvk+Tueb9IE5aguOSaICgurfEH2Lts/tdGq9Kc=;
        b=KYjf7RkaJ7QIWAbt+2Jt8ScIggnoc4rx/02eYQVIY4W+crV+15cmbj6fWijfBaGenp
         lMN4swt1kwaZMoC+swAtcXb8KCXV457Akz9pyr7P8eeAxdkCWSbafrYQlwSXhJohzfdC
         V6DBuiGMZiyrcOHGCAU1xFpYNqiiIfbm65KKBSX0Cx34wkDR3BdiiGMfuaGsI0FDxIfF
         UDe1szGaHffr6jlpUhiDlJ5P6NI0iO8hAZJg2hKhinNs9se7Zv3YpckUkSKLcqk5HgRp
         U18P/YRRe0PtQV1gftczZlYGHdyVGd+4TRqYNwSoD5rmsDQerjSlzN3SWF2x873QSHhE
         uhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698489011; x=1699093811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mg4LJQvk+Tueb9IE5aguOSaICgurfEH2Lts/tdGq9Kc=;
        b=HZiHRI3po0tlOcEqMcfF1r/xJd2QgNd76R+/x6jT6yy/ksfnT5B2aqiTDOdZq1Umpx
         vrlg4A4mCFSYxJEn66FKFr/6EMHa5mW96ACcAjDxjo2BBOymnoTgQEQKB/Os5RELTkLY
         0KEipzdQO9Syjnj9DXWZThxiVwEDforbTuHMrA6y5prAHmDIqdv7OPjNtyr3NOJj2TbA
         l5ARz806wX3ZxXmmfLtRci6awS9YUyOJBRns+FRxUcE71uZnm0Qk5RqYroeynmbzlIpn
         hbKyFngcHWlsdEdG06xhbnlEXNuiAeK0NaHaPS0gVFCZW9OIfdiYxpWe6oG2NUBJJ+20
         i/3Q==
X-Gm-Message-State: AOJu0YzZ5aHLdcagL+YWRd+8w75E9kmAfbwJxV9YJHE722wSrCwBM3Dd
	sBBwx43P4+OImulTzcQAtHgkpLTX8xQJOegkNq0=
X-Google-Smtp-Source: AGHT+IHYym988qIYMK32l3W75LcN2YUyrS+YwCjie3tOzWj9XZxjJ+Ot42KQwb5aVoSc7KxYEptVPb/ZFqtnEB8VO04=
X-Received: by 2002:a05:6402:2910:b0:53d:f180:3cc5 with SMTP id
 ee16-20020a056402291000b0053df1803cc5mr3625802edb.20.1698489010623; Sat, 28
 Oct 2023 03:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231021011025.568-1-andre.przywara@arm.com> <20231021011025.568-2-andre.przywara@arm.com>
In-Reply-To: <20231021011025.568-2-andre.przywara@arm.com>
From: Gunjan Gupta <viraniac@gmail.com>
Date: Sat, 28 Oct 2023 15:59:59 +0530
Message-ID: <CAJAzxbUcH3OK7famdZSAzDZM9gP6qDWwRL72ks9WDj7YVNjYPQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] sunxi: DRAM: H6: add barrier after finishing DRAM setup
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Tested the patch. With only dsb, it hangs within 5 reboots itself.
Adding udelay(50) moved it to once in 20 times. But it still hangs. So
this patch does not solve the problem

Thanks & Regards
Gunjan Gupta
