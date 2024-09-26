Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C454A3D97A
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727366923; cv=none; b=M+vwKrSw1slROO2Nuowp57jJ9az3wJTYKbnWfNnsGLijO9HffarLgzfCfv68C3jCA6gTs9lY5ZsnLUgo7uR5UDC32u+R71Kxxs5egWhJXXODTY5ja7BbbNYSdIeEcIyuEg0lit7QZ/Ze2NXeJf1MuOcTvSSaDXIBV/HGeF+VieU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727366923; c=relaxed/simple;
	bh=1CI/fpmiMGMi1J3jURicxvginVm5OIwiTVw57yhg7jw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aW1K+FOXBV3ixlb3v5IU0np/lqucM2G5jrjU3KJei0GZseQBb/BdZFtbtHMA+cGiQOPXs6IxaRJwa56WYek7I6WmU8ApNFArg1OtbQZOVwgHUL0FwOTmxYeBrg/I9dqlrrZ40wekI2ca/nrraYu30k86yKlOOkVgfDnJXGUt/ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQUgrGB4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQUgrGB4"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso36089766b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727366920; x=1727971720; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gP+KVl3Nki9xP9jnHdY7npTezgVnfLdw1bgRUHESfM8=;
        b=NQUgrGB4noLcXMFFIddeyOeThbj1IyGtFo9EyGfHCnC3u0zly3MjYq+TUkilUgy8G0
         552NPk60trNQrgIP0dTNeQVq9m+epetkQSh4YGFDnh1D6Gv0hgRnyUOJNU7gKBN9eC1C
         MAa7s017zunshbExj45OrSOLmX45Z7fF4484yZevRdSeO/ZzsIYLw4yXzL0RCTQikkqc
         NWTLxAZzEqSpwnOnhU8o3ui2960iFPQ73GFIXYJ6OMNNvwnLjqAhx1tXpQoQhy7VUp59
         y3NMBCCx1vm5Khn0iat7lepXQCvjiq/QNaEMYzQrnnUkzqzPpgDV/AGgSwsmiT0bvkgo
         WSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727366920; x=1727971720;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gP+KVl3Nki9xP9jnHdY7npTezgVnfLdw1bgRUHESfM8=;
        b=b9j+/tYZ0BdS4NO8yRRUdjIlhlf9POMK44FZZ5bcKQ6OghsQheXdpH7UAj2wp76kB8
         IC4hMKQhIm7cFRWLSLdiqabMr5eedo+jzZGl2bk7WrPeUibJNRFEZHaYKwGQYf8Ighi8
         m6qjzTGXQL2iWb4jSH6n0EJSNzJFzLsPZT2ZjZ0IaiPlMTd5bt7Fq4YhAOkYHdRsJ7uy
         XscM2ecQgcYN5Xhs6b42hhnRqyMZyAXc8AUvyZ4p62ZfFo8TedyjI7d+ckmmwWxiyivB
         qt+GSaJqowVTeWO8REL60o54S0oWGdRz5YeHz+PkdziVP1SZK1DF5Sii/B/i7eYD5VZ8
         EmMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc9/qe224Y1Z8YvxVvetkT2lCvyMVu509Ou8c4atDP6pwGb+Wo353okJMvdd64gx0kH1N/XKl422jG3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwITBddH0bd+uZGI8oT62gNpXAPB2ZSorVncM/Fexnfb/1NETyS
	Lejk1RX4A4VxGropinOuTsHJmJkGXYiGrypjJ/ovcrbZc2jt52M8
X-Google-Smtp-Source: AGHT+IHJD6ELGXqZ1LcvJSbwjs53CX/iyOKOge9JOfylo2K10ErpdDcSnwB/LYDMcLoXoMRgMBLADg==
X-Received: by 2002:a17:907:36cd:b0:a7a:acae:340b with SMTP id a640c23a62f3a-a93c32119afmr42883666b.31.1727366919820;
        Thu, 26 Sep 2024 09:08:39 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6d88-4cd9-a9d4-f267.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6d88:4cd9:a9d4:f267])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c70d3sm13947966b.78.2024.09.26.09.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 09:08:38 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/4] iio: adc: use scoped device_for_each_childe_node()
Date: Thu, 26 Sep 2024 18:08:36 +0200
Message-Id: <20240926-iio_device_for_each_child_node_scoped-v1-0-64ca8a424578@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAASH9WYC/x2NXQqDMBAGryL73ICNP2CvUsqiu1+ahZJIAqUg3
 t3Qx4Fh5qCKYqj06A4q+Fq1nBrcbx1JXNMbzrQx+d6P/eJnZ5ZZmyjgkAtjlcgS7aOcsoKr5B3
 qZJuGEXOYdNmotfaCYL//5/k6zwvp/FZhdwAAAA==
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727366918; l=1474;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=1CI/fpmiMGMi1J3jURicxvginVm5OIwiTVw57yhg7jw=;
 b=9sbPl0gcd83nFbHGowD5FIQz+dLJhH94gn6DMUgsGRmoscq/J8Acvc+dh92pABpm6VnlTSEw+
 rKGP2hFhzmLAOHlJD6dEO29nVZ5b7zWDqDL/ztTqX/8J9DlWpX+pgIi
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The device_for_each_child_node() macro requires calls to
fwnode_handle_put() upon early exits (break/return), and that has been a
constant source of bugs in the kernel.

This series switches to the more secure, scoped version of the macro
in the IIO subsystem, wherever the loop contains error paths. This
change simplifies the code and removes the explicit calls to
fwnode_handle_put(). In all cases the child node is only used for
parsing, and not assigned to be used later.

The straightforward uses of the loop with no error paths have been left
untouched, as their simplicity justifies the non-scoped variant.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (4):
      iio: adc: qcom-pm8xxx-xoadc: use scoped device_for_each_child_node()
      iio: adc: qcom-spmi-vadc: use scoped device_for_each_child_node()
      iio: adc: sun20i-gpadc: use scoped device_for_each_child_node()
      iio: adc: ad5755: use scoped device_for_each_child_node()

 drivers/iio/adc/qcom-pm8xxx-xoadc.c |  8 +++-----
 drivers/iio/adc/qcom-spmi-vadc.c    |  7 ++-----
 drivers/iio/adc/sun20i-gpadc-iio.c  |  7 ++-----
 drivers/iio/dac/ad5755.c            | 11 +++--------
 4 files changed, 10 insertions(+), 23 deletions(-)
---
base-commit: 92fc9636d1471b7f68bfee70c776f7f77e747b97
change-id: 20240926-iio_device_for_each_child_node_scoped-cb534e6f5d9b

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

