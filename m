Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1662199244
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Nov 2024 02:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731377627; cv=none; b=gWQ6NeVwXjRqbk3k8VUW/ViJ45zlIxGfwEz4FA/ZJsHje6IIXUgn4NeDqTlbmf0cCpx/reIFE8fr68XeqXN8o+Ezpz0ydBa3BoMu533njafKE3RVHOyHhyNPec7hreQtrQs0RaT2dhwNG3daiCT2/HK4+GzhGou06ndN1JCtZAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731377627; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EVYOvedO8NocAL6Mh8F/7ttXhiMkV/JCKXZceEsj5fapd2ZKJeSqy+fVd7d8Z7V8xkHFiORh8/GS4/JbCEReZXDWSO04FUravxgpZSNqlkMjc5VU1ls5p7+Jpmn4F69euBjWnLW44s+wix6idunG4vPLzOzjJG1UHLk5JzFvtZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQQ9M8qP; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQQ9M8qP"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e2dc61bc41so3727030a91.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 18:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731377625; x=1731982425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=NQQ9M8qP+heNOrcsLZZ+4k1+NFp7pgOlP10Ue+5Sis21dTBtOJ353UhNwOpcHGZ1gB
         llsgYyoO15hTs/tUR3JDr9arg1LghKEB7/B0opUz9yqRVG03kKkCwR/q06WfILmxrNR+
         c57dUZZpp2awtlW9yWyvuMF7gJORcolkYkoMPFKbohK5k8Plw+fxGMnv6yMFSmhJRPMc
         cTHvUDMk58vSInSLoXQQxFlnx8i9dZwY08hlHeqcrSD4h5RSAidkCoNheLhSJeXwBvYL
         EWCAXKFMCWEGiSABAck5ZBF54iEW/+ZRBPZv/hG9LsBNYO0/mzH9NZ5y70fjh4uIR14A
         MfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731377625; x=1731982425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=QYlUfupQaoHiR9gU/le0VcWrG9hbeLQ4m2KZA0Brk1GoJ99YMuuxVgELU+pTnSEvcn
         Vanl5cxDS0kpt2VitOa5dDOH4nhx+pzlRJxRFuaHB53m8ZzdZ2doFQukKMyPQdxRlSLX
         T/LHtOkqYtkb3JYrSmZ35r5dqbpeIrGbMwCT9qXd8Hd9F6hf/uVS1vyAYi6Vmr4L7jN+
         LlL2P0RutoVK8cgiPvvt3uLZzq9RggQJvlHsrAi5eq4roFdCZWwuLyFAQkVJIEVRs11T
         oN1rRWL1BtCHbQU4T9ZXScJW7JsykZlkYtL2ZqssXoJFGeSGedKCYYJ90UXKMOtzGcXw
         4FXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHsmtwwHoXfPD6rMtBN71ytg6MOb2pXFdmlC898Shvhjzp24IObe9SeWqXzJqwwiJQ4CAwDVCIXSW2Dw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrdjkJW845duD96CP611OXcx5OGz7UkE9F3sEUK6NSa1m9UYHv
	JSibD6HWSA4sPZ5/jhiBCafdAkbi9azloiOoBcM8OtlUd2Ojc/xo
X-Google-Smtp-Source: AGHT+IH+5UXelKsDy3oJZlypf0Kktdqo9U9iQ7oteV++YKpkDWgiAzqsABr0X0CYYwoE+B2WGNVBmQ==
X-Received: by 2002:a17:90b:52cd:b0:2e2:e597:6cd3 with SMTP id 98e67ed59e1d1-2e9b173943emr20532167a91.17.1731377625050;
        Mon, 11 Nov 2024 18:13:45 -0800 (PST)
Received: from localhost.localdomain ([119.139.196.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fee67fsm9223414a91.49.2024.11.11.18.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 18:13:44 -0800 (PST)
From: h1k0n <ybzjyhk@gmail.com>
To: charlie@rivosinc.com
Cc: ajones@ventanamicro.com,
	andy.chiu@sifive.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	evan@rivosinc.com,
	guoren@kernel.org,
	jernej.skrabec@gmail.com,
	jrtc27@jrtc27.com,
	jszhang@kernel.org,
	krzk+dt@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	samuel.holland@sifive.com,
	samuel@sholland.org,
	shuah@kernel.org,
	wens@csie.org
Subject: D1 vlenb
Date: Tue, 12 Nov 2024 10:12:26 +0800
Message-Id: <20241112021227.357-1-ybzjyhk@gmail.com>
X-Mailer: git-send-email 2.40.0.windows.1
In-Reply-To: <20240911-xtheadvector-v10-3-8d3930091246@rivosinc.com>
References: <20240911-xtheadvector-v10-3-8d3930091246@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

