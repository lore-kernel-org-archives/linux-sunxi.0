Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936803B7767
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Sep 2026 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260951; cv=pass; b=TfhZ4AOm+Ou1FeIQSMa5/04z4QqqzxJpV6GQC1w1+RWqOCACE4S+6ss1c3SqHXx9xVLNo1aZlM1jGGYC2RsHhv7ozLtZ1WM/TgNIy7lDagDNUlybuRdkPjQEUFwJJQv8C80dXhV7kQU4iGVS7/UyaiNfhCqWzcjnfMiTEVAVHkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260951; c=relaxed/simple;
	bh=9YOd5bZyODtN9cGxOXCDLK+zhRfQThyoLAp0qXa6H4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tocr4iVpXILiEgYnRjt2WBHfIQlwjjlnKVSzsqCozBls2fIRgwiLBtVMkqVOe8yRGUniTohZzp2TeIriPTS9Dw7NRmOCarY+aJvMucTtF9P7hDukEOF1lgHlUx7J9mc19FdLgWyFrPkYcapgj/ZjDZepCkld86tQ6ojNbSVmYkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkL498Au; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkL498Au"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aaf2ecfso1942139d50.1
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Sep 2026 07:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790260949; cv=none;
        d=google.com; s=arc-20260327;
        b=Zi+z+GRZUyA/XnySRxMVj73xJkcdoSLzwEBoh2hid+v1JGalxkB/u/we0dwWiX511e
         qxRS4c7ev87Bf7/pEr327G20S26Fu1Xpn28Hi0bebINoZ0I7oBWVr3LzIUL3rGbVzYH7
         BhvwbGWG6G7QBEqbEFhlfMkfDCG9O8x9Z1HTAme6kbKyRUoajF6W7dwC28cJl6w5kD9Z
         gQlw9Q1S7DFkSc70I4J4skSTYHROkG/tyBnST2gc15IUrtpuUTAHnIx1XYDY2pBCSRE6
         w2l6QHBgSODS5EzVihgbkHb0KkZt7+6WIcDpO5xciWlL2FYY5Dq6Deyt3L1OYAPdnjIC
         eN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9YOd5bZyODtN9cGxOXCDLK+zhRfQThyoLAp0qXa6H4c=;
        fh=t5Llxvw4Rd3C2kIVKxoLkHSZeX9j9R9nJ/SNwbKF4OI=;
        b=l/iKJkrKUnh5vCxqnJtl70pTNr+UAfD845Jer/izchibxm64VQ0Sv3cwSnYKbbLQRL
         3xkySZmbjQhuFIqa2L0jrjE39oTDGWxziMeKEgzJYZQK3vcVWNMw11wJ1YiwePlF9pVS
         4Bxk3bDyaMG36+6H+bFXoL5peUbOTksPF9PdRuFVC8rUkgYoXJAbvcrz2RhnD2sDX0cT
         cxvIhZNuyQDRKJ6cjxy+26/88uFJilSS891T/tfRpi6bhIkex2XFSUT64YR0/WUzq6eb
         DvvnwvzfAXVhX6MBx3cw2mcHirSeky9MbIIBpDv4f+gn1dzEdKsvBbUIdhCj0KQsVimp
         F6VA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790260949; x=1790865749; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9YOd5bZyODtN9cGxOXCDLK+zhRfQThyoLAp0qXa6H4c=;
        b=KkL498AuTgCkltfts+QYDg1sDzTaINCp29L4eXcrhE/msmkWP+GDhXy2GLViHebbLI
         +G37jOrE/QhnaI6GAshVc9YOKgclnjRy+BWvHUmlKsdyy9i57nghhcARnzYqMS0SQAMR
         +sNCq0AaCpHYmVZDpzNzusjm96CwEuxWM2dIhyTh/D1V6u2+DKlAwTW5kL3yuR8qgFSp
         st6BOFNxQAuEtsCdpKn90MAbjv4efvDVf7WnBr/lrwvDupBeB6xcU+mg+iPjDND6Is+A
         mrQFLPZFI25XNVtCfinshVyvw0ywxPVrtx03dIgEbZ8n+IfxF5CR9TOpEp/5uKibrs7Q
         CLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790260949; x=1790865749;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9YOd5bZyODtN9cGxOXCDLK+zhRfQThyoLAp0qXa6H4c=;
        b=FI2+ExRRN88H5XN124/bl5sIA6QLNnxv/kawSLHJS61jTJh25r2XcMsPyxpkMLx/pl
         sG1o9LpcM3rqp5Y2gvfu7fy4eNdurjSsr4lDv9AoA0e9xcVR/15+hwseC0pt3nElU4db
         C+DvkaTVNfXlFXXooE2dNww5fMSw8oyK7CzUFgPLcFYu1MEW5HSxscQv8ekNrVNbqTk6
         SXW/FvWsu7j0mL1RHxn3+Wj5e/cP8263WGydHMUM5oKcBnqyGyWRQG5fnvMtGnoKg23B
         ObGFus5UAmHI6woXmumhYig3yjNQ44F63oRHUABGBeCRn1xtfznaLZIID2uLPw/mGL0l
         6VYg==
X-Forwarded-Encrypted: i=1; AKwUvBz+wce8mvBg30s7PYA0PnSsIvgsbTgANSeNfTqjrUinLIe5jA8IZ7GSG2KPLYq/0cgvd+bWTyKWBkn5Wg==@lists.linux.dev
X-Gm-Message-State: AFuF++mX1bjtFeoERbVeYfdQGJwGf03v0QaYivpT4VDB63cpqIV+Gib7
	JOeiHUQzksJXJ0pWzDk+alpzZEyRmX61PnRwTRnfTuoIUkE6ejqBOJr4KJzCrl9MYeIxtWNSppq
	MtThwLYwYXkrWJxWqp3SDGiGrnHwy0CQ=
X-Gm-Gg: AYBFou3v/G4zNoNXVpSw9wtb6wNjVNZ2KKa9JsMXKtn9OzRVKiaPA6H4sRXqtQ2VRu2
	yJLL3tu1occfBWJjomm7Q0yR6EBedxJ15DXCzDN68JuW5q63EvLXjUN9j2Uajv8ZNWaRA3pG6X/
	5DLLPrQvknelAlbGmKGGPcw/mWn1O7lMJ3KGa5eQYX170Ybu55HZQDm8r5FupuaehNISPZzt354
	bq51MaIVbtecoCRGRFZpqUSfEZdVpDCHphdiJUaGkBj1S883fNIUuRrxPzlDxcYgMlsh8aC7c/d
	utilYXjOSI41MTDepnv3EKEj4am+3Hh2ZdxzCJlzHtQ8usFagRS/x8hEOw==
X-Received: by 2002:a05:690e:4386:b0:672:a52c:db1f with SMTP id
 956f58d0204a3-672ed48ebadmr1187815d50.103.1790260949554; Thu, 24 Sep 2026
 07:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923112009.1062-1-anykey196@gmail.com> <20260923112009.1062-2-anykey196@gmail.com>
 <b01154aa-16be-4dbb-861f-d4a70da7ad83@arm.com>
In-Reply-To: <b01154aa-16be-4dbb-861f-d4a70da7ad83@arm.com>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Thu, 24 Sep 2026 19:42:17 +0500
X-Gm-Features: AclHuK_hCbEyvfcHbTXKt-ecvSOb-lEWKE5cl3FOBZCvjRjKdS35-bDLlzlza6k
Message-ID: <CANHPwAT=tDAnTY6hor0WssxiYFh27doZeD=j42WHxX=3fUcHyQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: h616: orangepi-zero2w: add
 SDIO WiFi/BT (AW859A)
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I'd better rework my patch and letter, do more testing and then resend it.
